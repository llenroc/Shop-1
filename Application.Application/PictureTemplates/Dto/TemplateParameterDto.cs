using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.PictureTemplates.Dto
{
    [AutoMap(typeof(TemplateParameter))]
    public class TemplateParameterDto : NullableIdDto
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string DisplayName { get; set; }

        [Required]
        public TemplateParameterType Type { get; set; }

        public string Value { get; set; }

        public FontStyle FontStyle { get; set; }

        public Coordinate Coordinate { get; set; }

        public TemplateParameterDto()
        {
            FontStyle = new FontStyle();
            Coordinate = new Coordinate();
        }
    }
}
