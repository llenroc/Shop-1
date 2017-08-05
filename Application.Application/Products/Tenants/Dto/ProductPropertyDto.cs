using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(ProductProperty))]
    public class ProductPropertyDto:EntityDto
    {
        public int ProductId { get; set; }

        public string Name { get; set; }

        public string Value { get; set; }
    }
}
