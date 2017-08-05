using Application.AreaAgents;
using Application.Channel.ChannelAgents;
using Application.Configuration;
using Application.Distributions;
using Application.Orders.Events;
using Application.Products.Orders.Entities;
using Application.Sales;
using Application.Shops;
using Application.Wallets;
using Infrastructure;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;
using System;
using System.Collections.Generic;

namespace Application.Products.Orders.EventHandlers
{
    public class RebateProductOrderPayedEventHandler : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public ISettingManager SettingManager { get; set; }
        public DistributionManager DistributionManager { get; set; }
        public ChannelAgentProductDistributionManager ChannelAgentProductDistributionManager { get; set; }
        public ChannelAgentManager ChannelAgentManager { get; set; }
        public ChannelAgentRebateManager ChannelAgentRebateManager { get; set; }
        public AreaAgentRebateManager AreaAgentRebateManager { get; set; }
        public WalletManager WalletManager { get; set; }
        public WithdrawManager WithdrawManager { get; set; }
        public SalesManager SalesManager { get; set; }

        public void HandleEvent(OrderPayedEventData eventData)
        {
            if (eventData.Order is ProductOrder)
            {
                ProductOrder order = eventData.Order as ProductOrder;

                if (order.DisableProductRebate)
                {
                    return;
                }

                //Distribution and ChannelAgency Rebate
                if ((DistributionWhen)Enum.Parse(typeof(DistributionWhen), 
                    SettingManager.GetSettingValue(ShopSettings.Distribution.DistributionWhen)) == DistributionWhen.Payed)
                {
                    AsyncHelper.RunSync(async () =>
                    {
                        List<OrderDistribution> orderDistributions = await DistributionManager.TryAndCreateOrderDistributionAsync(order);
                        List<OrderChannelAgentProductDistribution> orderChannelAgentProductDistribution = new List<OrderChannelAgentProductDistribution>();

                        if (!order.DisableChannelAgentProductDistribution)
                        {
                            orderChannelAgentProductDistribution = await ChannelAgentProductDistributionManager.TryAndCreateOrderChannelAgentDistributionAsync(order);
                        }
                        List<ChannelAgentRebate> channelAgentRebates = await ChannelAgentRebateManager.TryAndCreateOrderChannelAgentRebatesAsync(order);
                        List<AreaAgentRebate> areaAgentRebates = await AreaAgentRebateManager.TryAndCreateOrderAreaAgentRebate(order);

                        bool rebateGuarantee = SettingManager.GetSettingValue<bool>(ShopSettings.Distribution.RebateGuarantee);
                        bool autoWithdraw = SettingManager.GetSettingValue<bool>(ShopSettings.Distribution.AutoWithdraw);

                        List<long> userList = new List<long>();

                        foreach (OrderDistribution orderDistribution in orderDistributions)
                        {
                            if (!userList.Contains(orderDistribution.UserId))
                            {
                                userList.Add(orderDistribution.UserId);
                            }
                        }

                        foreach (OrderChannelAgentProductDistribution orderDistribution in orderChannelAgentProductDistribution)
                        {
                            if (!userList.Contains(orderDistribution.UserId))
                            {
                                userList.Add(orderDistribution.UserId);
                            }
                        }

                        foreach (ChannelAgentRebate channelAgentRebate in channelAgentRebates)
                        {
                            if (!userList.Contains(channelAgentRebate.UserId))
                            {
                                userList.Add(channelAgentRebate.UserId);
                            }
                        }

                        foreach (AreaAgentRebate areaAgentRebate in areaAgentRebates)
                        {
                            if (!userList.Contains(areaAgentRebate.UserId))
                            {
                                userList.Add(areaAgentRebate.UserId);
                            }
                        }
                        bool enableSalesOfSelf = SettingManager.GetSettingValue<bool>(SpreadSettings.General.EnableSalesOfSelf);

                        if (enableSalesOfSelf&& !userList.Contains(order.UserId))
                        {
                            SalesManager.IncreaseSales(order.UserId, order.Money);
                        }

                        foreach (long userId in userList)
                        {
                            SalesManager.IncreaseSales(userId, order.Money);

                            if (!rebateGuarantee && autoWithdraw)
                            {
                                try
                                {
                                    await WithdrawManager.WithdrawAllBalanceAsync(new UserIdentifier(order.TenantId, userId));
                                }
                                catch
                                {

                                }
                            }
                        }
                    });
                }
            }
        }
    }
}
