using Infrastructure.Domain.Services;

namespace Application.Products.Orders.Ship.ShipProviders
{
    public interface IShipProvider:IDomainService
    {
        void Ship(ShipRequest shipRequest);
    }
}
