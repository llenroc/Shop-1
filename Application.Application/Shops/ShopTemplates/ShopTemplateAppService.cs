using Application.Shops.ShopTemplates.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Shops.ShopTemplates
{
    public class ShopTemplateAppService : CrudAppService<ShopTemplate, ShopTemplateDto>,
        IShopTemplateAppService
    {
        public ShopTemplateAppService(IRepository<ShopTemplate> respository) 
            :base(respository)
        {
        }
        public async Task<ShopTemplateDto> GetShopTemplateOfShopAsync()
        {
            ShopTemplate shopTemplate = Repository.GetAll().FirstOrDefault();
            ShopTemplateDto shopTemplateDto = shopTemplate.MapTo<ShopTemplateDto>();
            return shopTemplateDto;
        }

        public async Task<ShopTemplateCreateOrEditDto> GetShopTemplateForCreateOrEdit(NullableIdDto input)
        {
            ShopTemplateCreateOrEditDto shopTemplateCreateOrEditDto;

            if (input.Id.HasValue)
            {
                ShopTemplate shopTemplate =await Repository.GetAsync(input.Id.Value);
                shopTemplateCreateOrEditDto = shopTemplate.MapTo<ShopTemplateCreateOrEditDto>();
            }
            else
            {
                shopTemplateCreateOrEditDto = new ShopTemplateCreateOrEditDto();
            }
            return shopTemplateCreateOrEditDto;
        }

        public ShopTemplateCreateOrEditDto CreateOrUpdateShopTemplate(ShopTemplateCreateOrEditDto input)
        {
            if (!input.Id.HasValue)
            {
                CheckCreatePermission();
                var entity = input.MapTo<ShopTemplate>();
                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                return entity.MapTo<ShopTemplateCreateOrEditDto>();
            }
            else
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.Id.Value);
                ObjectMapper.Map(input, entity);

                CurrentUnitOfWork.SaveChanges();
                return entity.MapTo<ShopTemplateCreateOrEditDto>();
            }
        }

        public void SetAsDefault(IdInput input)
        {
            ShopTemplate currentDefault = Repository.GetAll().Where(model => model.IsDefault).FirstOrDefault();

            if (currentDefault != null)
            {
                currentDefault.IsDefault = false;
                Repository.Update(currentDefault);
            }
            ShopTemplate shopTemplate = Repository.Get(input.Id);
            shopTemplate.IsDefault = true;
            Repository.Update(shopTemplate);
        }
    }
}
