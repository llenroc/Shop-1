using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(ProductUnit))]
    public class ProductUnitDto : EntityDto
    {
        public string Name { get; set; }
        public int Ratio { get; set; }
    }
}
