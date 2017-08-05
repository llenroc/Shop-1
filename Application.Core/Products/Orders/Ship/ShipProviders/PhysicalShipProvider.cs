using Application.Orders.Entities;
using Application.Products.Orders.Entities;

namespace Application.Products.Orders.Ship.ShipProviders
{
    public class PhysicalShipProvider:ApplicationDomainServiceBase, IShipProvider
    {
        protected ProductOrderManager OrderManager;

        public PhysicalShipProvider(ProductOrderManager orderManager)
        {
            OrderManager = orderManager;
        }

        public void Ship(ShipRequest shipRequest)
        {
            foreach (OrderItem orderItem in shipRequest.Order.OrderItems)
            {
                ShipOrderItem(orderItem);
            }
            OrderManager.CheckShipProgressAndCompleteShip(shipRequest.Order, shipRequest.ExpressInfo);
        }

        private void ShipOrderItem(OrderItem orderItem)
        {
            if (orderItem.ShipStatus != ShipStatus.UnShip)
            {
                return;
            }

            if (orderItem.Specification.Product.Type == Products.ProductType.Physical)
            {
                orderItem.ShipStatus = ShipStatus.Shipping;
            }
        }
    }
}
