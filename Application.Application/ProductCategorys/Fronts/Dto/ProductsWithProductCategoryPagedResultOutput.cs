using Application.Products.Fronts.Dto;
using Infrastructure.Application.DTO;

namespace Application.ProductCategorys.Fronts.Dto
{
    public class ProductsWithProductCategoryPagedResultOutput:PagedResultDto<ProductListDto>
    {
        public ProductCategoryDto ProductCategory { get; set; }
    }
}
