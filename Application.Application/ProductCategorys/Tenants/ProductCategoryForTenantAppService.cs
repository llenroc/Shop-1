using Application.ProductCategorys.Tenants.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Threading.Tasks;

namespace Application.ProductCategorys.Tenants
{
    public class ProductCategoryForTenantAppService : CrudAppService<ProductCategory, ProductCategoryDto>, IProductCategoryForTenantAppService
    {
        public ProductCategoryForTenantAppService(IRepository<ProductCategory> respository) :base(respository)
        {

        }

        public async Task<ProductCategoryForEditOutput> GetProductCategoryForEdit(NullableIdDto input)
        {
            ProductCategoryCreateOrEditDto productCategoryEditDto;

            if (input.Id.HasValue) //Editing existing edition?
            {
                ProductCategory productCategory = await Repository.GetAsync(input.Id.Value);
                productCategoryEditDto = productCategory.MapTo<ProductCategoryCreateOrEditDto>();
            }
            else
            {
                productCategoryEditDto = new ProductCategoryCreateOrEditDto();
            }

            return new ProductCategoryForEditOutput
            {
                ProductCategory= productCategoryEditDto
            };
        }

        public ProductCategoryDto CreateOrUpdateProductCategory(ProductCategoryCreateOrEditDto input)
        {
            if (!input.Id.HasValue)
            {
                CheckCreatePermission();

                var entity =input.MapTo<ProductCategory>();

                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                return MapToEntityDto(entity);
            }
            else
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.Id.Value);
                ObjectMapper.Map(input, entity);
                CurrentUnitOfWork.SaveChanges();

                return MapToEntityDto(entity);
            }
        }
    }
}
