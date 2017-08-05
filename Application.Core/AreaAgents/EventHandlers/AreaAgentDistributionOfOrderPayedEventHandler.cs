using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Orders.Events;
using Application.Shops;
using Application.Wallets;
using Infrastructure;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;
using System.Collections.Generic;

namespace Application.AreaAgents.EventHandlers
{
    public class AreaAgentDistributionOfOrderPayedEventHandler : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public ISettingManager SettingManager { get; set; }
        public AreaAgentDistributionManager AreaAgentDistributionManager { get; set; }
        public WithdrawManager WithdrawManager { get; set; }

        [UnitOfWork]
        public void HandleEvent(OrderPayedEventData eventData)
        {
            if (eventData.Order is AreaAgencyApplyOrder)
            {
                AreaAgencyApplyOrder order = eventData.Order as AreaAgencyApplyOrder;

                AsyncHelper.RunSync(async () =>
                {
                    List<OrderAreaAgentDistribution> orderDistributions = await AreaAgentDistributionManager.TryAndCreateOrderDistributionAsync(order);
                    List<long> userList = new List<long>();

                    foreach (OrderAreaAgentDistribution orderDistribution in orderDistributions)
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
