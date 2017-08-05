using Infrastructure.Application.DTO;
using System.Collections.Generic;

namespace Application.Products.Tenants.Dto
{
    public class SpecificationForCreateOrEditInput : NullableIdDto
    {
        public int? ProductId { get; set; }

        public string Picture { get; set; }

        public string CardValue { get; set; }

        public int Stock { get; set; }

        public int Sale { get; set; }

        public decimal Price { get; set; }

        public ProductStatus Status { get; set; }

        public string Number { get; set; }

        public string Barcode { get; set; }

        public List<SpecificationPropertyValueForCreateOrEditDto> PropertyValues { get; set; }
    }
}
