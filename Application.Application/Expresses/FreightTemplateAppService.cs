using Application.Expresses.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Expresses
{
    public class FreightTemplateAppService : CrudAppService<FreightTemplate, FreightTemplateDto>,
        IFreightTemplateAppService
    {
        public IRepository<DeliveryArea> DeliveryAreaRespository { get; set; }

        public FreightTemplateAppService(IRepository<FreightTemplate> respository) 
            :base(respository)
        {
        }

        public async Task<FreightTemplateCreateOrEditDto> GetFreightTemplateForCreateOrEdit(NullableIdDto input)
        {
            FreightTemplateCreateOrEditDto freightTemplateCreateOrEditDto;

            if (input.Id.HasValue)
            {
                FreightTemplate freightTemplate = Repository.Get(input.Id.Value);
                freightTemplateCreateOrEditDto = freightTemplate.MapTo<FreightTemplateCreateOrEditDto>();
            }
            else
            {
                freightTemplateCreateOrEditDto = new FreightTemplateCreateOrEditDto();
            }
            return freightTemplateCreateOrEditDto;
        }

        public FreightTemplateCreateOrEditDto CreateOrUpdateFreightTemplate(FreightTemplateCreateOrEditDto input)
        {
            if (!input.Id.HasValue)
            {
                CheckCreatePermission();
                var entity = input.MapTo<FreightTemplate>();
                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                return entity.MapTo<FreightTemplateCreateOrEditDto>();
            }
            else
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.Id.Value);
                ObjectMapper.Map(input, entity);

                List<DeliveryArea> deliveryAreas = new List<DeliveryArea>();

                foreach (DeliveryAreaDto deliveryAreaDto in input.DeliveryAreas)
                {
                    if (deliveryAreaDto.Id.HasValue)
                    {
                        var deliveryArea = DeliveryAreaRespository.Get(deliveryAreaDto.Id.Value);
                        ObjectMapper.Map(deliveryAreaDto, deliveryArea);
                        deliveryAreas.Add(deliveryArea);
                    }
                    else
                    {
                        deliveryAreas.Add(deliveryAreaDto.MapTo<DeliveryArea>());
                    }
                }
                entity.DeliveryAreas = deliveryAreas;

                CurrentUnitOfWork.SaveChanges();
                return entity.MapTo<FreightTemplateCreateOrEditDto>();
            }
        }
    }
}
