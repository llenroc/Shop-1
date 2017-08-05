using Application.Orders.Events;
using Application.Wallets;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Products.Orders.EventHandlers
{
    public class OrderReceivedEventHandler: ApplicationDomainServiceBase, IEventHandler<OrderReceivedEventData>, ITransientDependency
    {
        public WalletManager WalletManager { get; set; }

        public void HandleEvent(OrderReceivedEventData eventData)
        {
            WalletManager.UnFreezeWalletRecordFromOrder(eventData.Order);
        }
    }
}
