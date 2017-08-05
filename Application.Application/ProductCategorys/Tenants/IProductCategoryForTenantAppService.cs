using Application.ProductCategorys.Tenants.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.ProductCategorys.Tenants
{
    public interface IProductCategoryForTenantAppService : ICrudAppService<ProductCategoryDto>
    {
        Task<ProductCategoryForEditOutput> GetProductCategoryForEdit(NullableIdDto input);

        ProductCategoryDto CreateOrUpdateProductCategory(ProductCategoryCreateOrEditDto input);
    }
}
