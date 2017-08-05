using Application.Products;
using Application.Products.Fronts.Dto;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMap(typeof(Specification))]
    public class SpecificationForBoughtItemDto
    {
        public string Picture { get; set; }

        public int Stock { get; set; }

        public ProductStatus Status { get; set; }

        public string Number { get; set; }

        public string Barcode { get; set; }

        public decimal Price { get; set; }

        public ProductForSpecificationDto Product { get; set; }

        public List<SpecificationPropertyValueDto> PropertyValues { get; set; }

        public string FullName { get; set; }
    }
}
