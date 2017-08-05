using Application.PictureTemplates.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.PictureTemplates
{
    public interface IPictureTemplateAppService : ICrudAppService<PictureTemplateDto>
    {
        CreateOrEditPictureTemplateDto GetPictureTemplateForCreateOrEdit(NullableIdDto input);

        CreateOrEditPictureTemplateDto CreateOrEdit(CreateOrEditPictureTemplateDto input);
    }
}
