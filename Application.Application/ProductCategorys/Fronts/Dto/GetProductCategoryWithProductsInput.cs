using Infrastructure.Application.DTO;

namespace Application.ProductCategorys.Fronts.Dto
{
    public class GetProductCategoryWithProductsInput:IdInput
    {
        public int MaxCount { get; set; }
    }
}
