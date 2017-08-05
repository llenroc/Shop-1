using Application.Orders.BoughtContexts;
using Application.Orders.SalePriceServices;
using Infrastructure.Dependency;

namespace Application.Orders.SalePriceProviders
{
    public class SalePriceProvider: ISalePriceProvider<BoughtContext>,ISingletonDependency
    {
        public SalePriceService SalePriceService { get; set; }

        public BoughtContext Caculate(BoughtContext boughtContext)
        {
            SalePriceService.Calculate(boughtContext);
            return boughtContext;
        }
    }
}
