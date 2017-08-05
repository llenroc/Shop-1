using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(SpecificationProperty))]
    public class SpecificationPropertyDto:AuditedEntityDto
    {
        [Required]
        public string Name { get; set; }

        public string Description { get; set; }

        public SpecificationPropertyType Type { get; set; }
    }
}
