using Application.Products.Tenants.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.Products.Tenants
{
    public interface IProductForTenantAppService: ICrudAppService<ProductDto, int, ProductGetAllInput>
    {
        ProductForCreateOrEditOutput GetProductForCreateOrEdit(NullableIdDto input);

        ProductDto CreateOrEdit(ProductCreateOrEditInput input);

        void RemoveCustomCustomerInfo(IdInput input);

        void RemoveProperty(IdInput input);

        void RemoveProductUnit(IdInput input);

        void RemoveDistribution(IdInput input);

        void RemoveChannelAgentProductDistribution(IdInput input);

        void OnProduct(IdInput input);

        void OffProduct(IdInput input);

        void RemoveSpecification(IdInput input);
    }
}
