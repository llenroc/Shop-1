using Application.Orders.Events;
using Application.Wallets;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Products.Orders.EventHandlers
{
    public class OrderRefundEventHandler: ApplicationDomainServiceBase, IEventHandler<OrderRefundEventData>, ITransientDependency
    {
        public WalletManager WalletManager { get; set; }

        public void HandleEvent(OrderRefundEventData eventData)
        {
            WalletManager.InvalidWalletRecordsFromOrder(eventData.Order);
        }
    }
}
