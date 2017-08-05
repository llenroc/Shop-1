using Application.Shops.ShopTemplates.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Shops.ShopTemplates
{
    public interface IShopTemplateAppService : ICrudAppService<ShopTemplateDto>
    {
        Task<ShopTemplateDto> GetShopTemplateOfShopAsync();

        Task<ShopTemplateCreateOrEditDto> GetShopTemplateForCreateOrEdit(NullableIdDto input);

        ShopTemplateCreateOrEditDto CreateOrUpdateShopTemplate(ShopTemplateCreateOrEditDto input);

        void SetAsDefault(IdInput input);
    }
}
