using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(Specification))]
    public class SpecificationDto: FullAuditedEntityDto
    {
        public int ProductId { get; set; }

        public string Picture { get; set; }

        public string CardValue { get; set; }

        public int Stock { get; set; }

        public int Sale { get; set; }

        public decimal Price { get; set; }

        public ProductStatus Status { get; set; }

        public string Number { get; set; }

        public string Barcode { get; set; }

        public string Name { get; set; }

        public List<SpecificationPropertyValueDto> PropertyValues { get; set; }
    }
}
