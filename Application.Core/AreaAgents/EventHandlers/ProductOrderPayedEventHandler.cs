using Application.Orders.Events;
using Application.Products.Orders.Entities;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Orders.EventHandlers
{
    public class ProductOrderPayedEventHandler : ApplicationDomainServiceBase, IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public void HandleEvent(OrderPayedEventData eventData)
        {
            if(eventData.Order is ProductOrder)
            {
                ProductOrder order = eventData.Order as ProductOrder;
            }
        }
    }
}
