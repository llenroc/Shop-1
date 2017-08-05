using Application.Orders;
using Application.Products.Orders.Entities;
using Application.Products.Orders.Ship.ShipProviders;
using Infrastructure.Dependency;
using Infrastructure.Domain.Services;

namespace Application.Products.Orders.Ship
{
    public class ShipService:DomainService
    {
        private readonly IIocResolver _iocResolver;

        public ShipService(IIocResolver iocResolver)
        {
            _iocResolver = iocResolver;
        }

        public ProductOrder Ship(ProductOrder order,bool autoShip=false, ExpressInfo expressInfo = null)
        {
            IShipProvider[] ShipProviders = _iocResolver.ResolveAll<IShipProvider>();
            ShipRequest shipRequest = new ShipRequest()
            {
                Order=order,
                AutoShip=autoShip,
                ExpressInfo=expressInfo
            };

            foreach (IShipProvider shipProvider in ShipProviders)
            {
                if(autoShip&& shipProvider is PhysicalShipProvider)
                {
                    continue;
                }
                shipProvider.Ship(shipRequest);
            }
            return order;
        }
    }
}
