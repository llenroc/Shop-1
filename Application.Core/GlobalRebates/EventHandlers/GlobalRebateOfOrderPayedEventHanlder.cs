using Application.GlobalRebates;
using Application.Orders.Events;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;

namespace Application.Distributions.EventHandlers
{
    public class GlobalRebateOfOrderPayedEventHanlder : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public SettingManager SettingManager { get; set; }
        public GlobalRebateManager GlobalRebateManager { get; set; }

        public void HandleEvent(OrderPayedEventData eventData)
        {
            AsyncHelper.RunSync(async () =>
            {
                await GlobalRebateManager.TryAndCreateOrderGlobalRebateAsync(eventData.Order);
            });
        }
    }
}
