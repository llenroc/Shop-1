using Application.Orders.Entities;
using Application.Orders.Events;
using Application.Products.Orders.Entities;
using Application.Products.Orders.Ship;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Products.Orders.EventHandlers
{
    public class ShipVirtualCardProductOrderCreatedEventHandler : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public ShipService ShipService { get; set; }

        public void HandleEvent(OrderPayedEventData eventData)
        {
            if (eventData.Order is ProductOrder&&eventData.Order.OrderStatus==OrderStatus.UnShip)
            {
                ProductOrder order = eventData.Order as ProductOrder;

                if (order.OrderItems == null)
                {
                    return;
                }
                ShipService.Ship(order, true);
            }
        }
    }
}
