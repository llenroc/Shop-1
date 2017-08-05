using Application.ProductCategorys.Fronts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.ProductCategorys.Tenants
{
    public interface IProductCategoryForFrontAppService : IApplicationService
    {
        ProductsWithProductCategoryPagedResultOutput GetProductsWithProductCategoryOfPage(ProductsWithProductCategoryPagedResultInput input);

        ListResultDto<ProductCategoryDto> Gets();

        ProductCategoryWithProductListDto GetProductCategoryWithProducts(GetProductCategoryWithProductsInput input);
    }
}
