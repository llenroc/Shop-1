using Application.Orders.BoughtContexts;
using Infrastructure.Domain.Services;

namespace Application.Orders.SalePriceServices
{
    public class SalePriceService:DomainService
    {
        public BoughtContext Calculate(BoughtContext boughtContext)
        {
            return boughtContext;
        }
    }
}
