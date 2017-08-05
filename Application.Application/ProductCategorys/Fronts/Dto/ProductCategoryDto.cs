using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.ProductCategorys.Fronts.Dto
{
    [AutoMap(typeof(ProductCategory))]
    public class ProductCategoryDto:EntityDto
    {
        public string Name { get; set; }

        public string Icon { get; set; }

        public int? ParentId { get; set; }
    }
}
