using Infrastructure.Application.DTO;

namespace Application.ProductCategorys.Fronts.Dto
{
    public class ProductsWithProductCategoryPagedResultInput:PagedAndSortedResultRequestDto
    {
        public int ProductCategoryId { get; set; }
    }
}
