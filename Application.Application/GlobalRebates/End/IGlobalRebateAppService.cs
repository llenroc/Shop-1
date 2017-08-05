using Application.GlobalRebates.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.GlobalRebates.End
{
    public interface IGlobalRebateAppService : ICrudAppService<GlobalRebateDto>
    {
        Task<GlobalRebateCreateOrEditDto> GetGlobalRebateForEdit(NullableIdDto input);

        GlobalRebateCreateOrEditDto CreateOrUpdateGlobalRebate(GlobalRebateCreateOrEditDto input);
    }
}