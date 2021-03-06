﻿using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Fronts.Dto
{
    [AutoMap(typeof(Specification))]
    public class ProductSpecificationDto:EntityDto
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

        public string FullName { get; set; }
    }
}
