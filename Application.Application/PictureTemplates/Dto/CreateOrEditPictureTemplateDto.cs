using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.PictureTemplates.Dto
{
    [AutoMap(typeof(PictureTemplate))]
    public class CreateOrEditPictureTemplateDto : NullableIdDto
    {
        public string Name { get; set; }

        public string Template { get; set; }

        public List<TemplateParameterDto> Parameters { get; set; }

        public bool IsDefault { get; set; }
    }
}
