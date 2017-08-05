using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Channel.ChannelAgents;
using Application.Distributions;
using Application.Orders.Events;
using Application.Shops;
using Application.Wallets;
using Infrastructure;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;
using System;
using System.Collections.Generic;

namespace Application.Channel.EventHandlers
{
    public class ChannelAgentDistributionOfOrderPayedEventHandler : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public ISettingManager SettingManager { get; set; }
        public ChannelAgentDistributionManager ChannelAgentDistributionManager { get; set; }
        public WithdrawManager WithdrawManager { get; set; }

        [UnitOfWork]
        public void HandleEvent(OrderPayedEventData eventData)
        {
            if (eventData.Order is ChannelAgencyApplyOrder)
            {
                ChannelAgencyApplyOrder order = eventData.Order as ChannelAgencyApplyOrder;

                if ((DistributionWhen)Enum.Parse(typeof(DistributionWhen), SettingManager.GetSettingValue(ShopSettings.Distribution.DistributionWhen)) == DistributionWhen.Payed)
                {
                    AsyncHelper.RunSync(async () =>
                    {
                        List<OrderChannelAgentDistribution> orderDistributions = await ChannelAgentDistributionManager.TryAndCreateOrderDistributionAsync(order);
                        List<long> userList = new List<long>();

                        foreach (OrderChannelAgentDistribution orderDistribution in orderDistributions)
                        {
                            if (!userList.Contains(orderDistribution.UserId))
                            {
                                userList.Add(orderDistribution.UserId);
                            }
                        }
                        bool autoWithdraw = SettingManager.GetSettingValue<bool>(ShopSettings.Distribution.AutoWithdraw);

                        if (autoWithdraw)
                        {
                            foreach (long userId in userList)
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
