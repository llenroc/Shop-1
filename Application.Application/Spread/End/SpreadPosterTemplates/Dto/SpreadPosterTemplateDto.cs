using Application.PictureTemplates.Dto;
using Application.Spread.SpreadPosters.SpreadPosterTemplates;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Spread.End.SpreadPosterTemplates.Dto
{
    [AutoMap(typeof(SpreadPosterTemplate))]
    public class SpreadPosterTemplateDto:AuditedEntityDto
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Template { get; set; }

        public List<TemplateParameterDto> Parameters { get; set; }

        public bool IsDefault { get; set; }
    }
}
