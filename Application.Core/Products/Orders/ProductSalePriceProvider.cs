using Application.Orders.SalePriceProviders;
using Infrastructure.Dependency;

namespace Application.Products.Orders
{
    public class ProductSalePriceProvider: ISalePriceProvider<ProductBoughtContext>,ISingletonDependency
    {
        public ProductSalePriceService ProductSalePriceService { get; set; }

        public ProductBoughtContext Caculate(ProductBoughtContext boughtContext)
        {
            ProductSalePriceService.Calculate(boughtContext);
            return boughtContext;
        }
    }
}
