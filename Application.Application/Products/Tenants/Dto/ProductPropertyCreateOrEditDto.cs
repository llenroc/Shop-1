using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(ProductProperty))]
    public class ProductPropertyCreateOrEditDto:NullableIdDto
    {
        public int? ProductId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Value { get; set; }
    }
}
