using Application.Products.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMap(typeof(OrderItem))]
    public class OrderItemWithCommentDto : EntityDto
    {
        public long UserId { get; set; }

        public int SpecificationId { get; set; }

        public int? CartItemId { get; set; }
       
        public int Count { get; private set; }

        public decimal Price { get; set; }

        public decimal Money { get; set; }

        public virtual SpecificationForOrderItemDto Specification { get; set; }

        public ProductCommentDto Comment { get; set; }

        public bool IsCommented { get; set; }
    }
}
