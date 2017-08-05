using Application.Orders.Events;
using Application.Wallets;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Products.Orders.EventHandlers
{
    public class OrderRefunedEventHandler : ApplicationDomainServiceBase, IEventHandler<OrderRefundEventData>, ITransientDependency
    {
        public WalletManager WalletManager { get; set; }

        public void HandleEvent(OrderRefundEventData eventData)
        {
            WalletManager.UnFreezeWalletRecordFromOrder(eventData.Order);
        }
    }
}
