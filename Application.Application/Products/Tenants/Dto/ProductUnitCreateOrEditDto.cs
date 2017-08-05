using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(ProductUnit))]
    public class ProductUnitCreateOrEditDto : NullableIdDto
    {
        public int? ProductId { get; set; }

        public string Name { get; set; }

        public int Ratio { get; set; }
    }
}
