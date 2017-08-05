using Application.Orders.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Products.Orders.Entities
{
    public class OrderItem : AuditedEntity
    {
        public int OrderId { get; set; }

        public virtual ProductOrder Order { get;set;}

        public int SpecificationId { get; set; }

        public int? CartItemId { get; set; }

        public int Count { get; private set; }

        public decimal Price { get; set; }

        public decimal Money { get; set; }

        public ShipStatus ShipStatus { get; set; }

        public virtual Specification Specification { get;set;}

        public virtual ProductComment Comment { get; set; }

        public bool IsCommented { get; set; }

        public bool IsGift { get; set; }
    }
}
