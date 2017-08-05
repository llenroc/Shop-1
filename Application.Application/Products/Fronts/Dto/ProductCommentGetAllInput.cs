using Infrastructure.Application.DTO;

namespace Application.Products.Fronts.Dto
{
    public class ProductCommentGetAllInput:PagedAndSortedResultRequestDto
    {
        public int ProductId { get; set; }
    }
}
