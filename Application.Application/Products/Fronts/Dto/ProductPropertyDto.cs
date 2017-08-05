using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Fronts.Dto
{
    [AutoMap(typeof(ProductProperty))]
    public class ProductPropertyDto:EntityDto
    {
        public string Name { get; set; }

        public string Value { get; set; }
    }
}
