using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.PictureTemplates.Dto
{
    [AutoMap(typeof(PictureTemplate))]
    public class PictureTemplateDto : AuditedEntityDto
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Template { get; set; }

        public List<TemplateParameterDto> Parameters { get; set; }
    }
}
