using Application.Products.Fronts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.ProductCategorys.Fronts.Dto
{
    [AutoMap(typeof(ProductCategory))]
    public class ProductCategoryWithProductListDto : EntityDto
    {
        public string Name { get; set; }

        public string Icon { get; set; }

        public int? ParentId { get; set; }

        [NotMapped]
        public List<ProductListDto> Products { get; set; }
    }
}
