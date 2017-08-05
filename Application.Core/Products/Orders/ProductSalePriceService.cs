using Infrastructure.Domain.Services;

namespace Application.Products.Orders
{
    public class ProductSalePriceService:DomainService
    {
        public ProductBoughtContext Calculate(ProductBoughtContext boughtContext)
        {
            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtItem.Price = boughtItem.Specification.Price;
                boughtItem.Money = boughtItem.Price * boughtItem.Count;
                boughtContext.Money += boughtItem.Money;
            }
            return boughtContext;
        }
    }
}
