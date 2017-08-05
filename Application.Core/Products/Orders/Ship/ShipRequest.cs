using Application.Orders;
using Application.Products.Orders.Entities;

namespace Application.Products.Orders.Ship
{
    public class ShipRequest
    {
        public ProductOrder Order { get; set; }

        public bool AutoShip { get; set; } = false;

        public ExpressInfo ExpressInfo { get; set; }
    }
}
