using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Products.Fronts.Dto
{
    [AutoMap(typeof(Specification))]
    public class SpecificationDto: FullAuditedEntityDto
    {
        public string Picture { get; set; }

        public int Stock { get; set; }

        public int Sale { get; set; }

        public ProductStatus Status { get; set; }

        public string Number { get; set; }

        public string Barcode { get; set; }

        public decimal Price { get; set; }

        public List<SpecificationPropertyValueDto> PropertyValues { get; set; }
    }
}
