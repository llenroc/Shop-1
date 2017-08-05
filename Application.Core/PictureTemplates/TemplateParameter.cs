using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;

namespace Application.PictureTemplates
{
    public enum TemplateParameterType
    {
        Text,
        Picture
    }

    public class TemplateParameter : Entity
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

        public TemplateParameter()
        {
            FontStyle = new FontStyle();
            Coordinate = new Coordinate();
        }
    }
}
