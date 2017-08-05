using Application.Configuration;
using Application.Orders.Events;
using Application.Spread;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;

namespace Application.Orders.EventHandlers
{
    public class SpreadOrderPayeddEventHandler : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public ISettingManager SettingManager { get; set; }
        public SpreadManager SpreadManager { get; set; }

        public void HandleEvent(OrderPayedEventData eventData)
        {
            decimal UpgradeOrderMoney = SettingManager.GetSettingValueForTenant<decimal>(SpreadSettings.General.UpgradeOrderMoney, 
                eventData.Order.TenantId);

            if (UpgradeOrderMoney>0&&eventData.Order.PayMoney>= UpgradeOrderMoney)
            {
                AsyncHelper.RunSync(async() =>
                {
                    await SpreadManager.SetAsSpreader(eventData.Order.GetUserIdentifier());
                });
                
            }
        }
    }
}
