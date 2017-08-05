using Application.Expresses.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Expresses
{
    public interface IFreightTemplateAppService : ICrudAppService<FreightTemplateDto>
    {
        Task<FreightTemplateCreateOrEditDto> GetFreightTemplateForCreateOrEdit(NullableIdDto input);
        FreightTemplateCreateOrEditDto CreateOrUpdateFreightTemplate(FreightTemplateCreateOrEditDto input);
    }
}
