using Application.Spread.End.SpreadPosterTemplates.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.Spread.End.SpreadPosterTemplates
{
    public interface ISpreadPosterTemplateAppService : ICrudAppService<SpreadPosterTemplateDto>
    {
        CreateOrEditSpreadPosterTemplateDto GetSpreadPosterTemplateForCreateOrEdit(NullableIdDto input);

        CreateOrEditSpreadPosterTemplateDto CreateOrEdit(CreateOrEditSpreadPosterTemplateDto input);

        void SetAsDefault(SpreadPosterGetInput input);
    }
}
