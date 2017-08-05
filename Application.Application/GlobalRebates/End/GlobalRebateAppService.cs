using Application.GlobalRebates.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Threading.Tasks;

namespace Application.GlobalRebates.End
{
    public class GlobalRebateAppService : CrudAppService<GlobalRebate, GlobalRebateDto>, IGlobalRebateAppService
    {
        public GlobalRebateAppService(IRepository<GlobalRebate> respository) :base(respository)
        {
        }

        public async Task<GlobalRebateCreateOrEditDto> GetGlobalRebateForEdit(NullableIdDto input)
        {
            GlobalRebateCreateOrEditDto globalRebateCreateOrEditDto;

            if (input.Id.HasValue) //Editing existing edition?
            {
                GlobalRebate globalRebate = await Repository.GetAsync(input.Id.Value);
                globalRebateCreateOrEditDto = globalRebate.MapTo<GlobalRebateCreateOrEditDto>();
            }
            else
            {
                globalRebateCreateOrEditDto = new GlobalRebateCreateOrEditDto();
            }

            return globalRebateCreateOrEditDto;
        }

        public GlobalRebateCreateOrEditDto CreateOrUpdateGlobalRebate(GlobalRebateCreateOrEditDto input)
        {
            if (!input.Id.HasValue)
            {
                CheckCreatePermission();

                var entity = input.MapTo<GlobalRebate>();

                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                return ObjectMapper.Map<GlobalRebateCreateOrEditDto>(entity);
            }
            else
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.Id.Value);
                ObjectMapper.Map(input, entity);
                CurrentUnitOfWork.SaveChanges();

                return ObjectMapper.Map<GlobalRebateCreateOrEditDto>(entity);
            }
        }
    }
}
