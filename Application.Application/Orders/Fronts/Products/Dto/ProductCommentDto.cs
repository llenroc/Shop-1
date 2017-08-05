using Application.Products;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMap(typeof(ProductComment))]
    public class ProductCommentDto:AuditedEntityDto
    {
        public int ProductId { get; set; }

        public int OrderId { get; set; }

        public int OrderItemId { get; set; }

        public string Content { get; set; }
    }
}
