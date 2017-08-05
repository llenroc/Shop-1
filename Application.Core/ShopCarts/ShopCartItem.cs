using Application.Products;
using Infrastructure.Domain.Entities;

namespace Application.ShopCarts
{
    public class ShopCartItem:Entity
    {
        public int ShopCartId { get; set; }

        public int SpecificationId { get; set; }

        public int Count { get;  set; }

        public virtual Specification Specification { get; set; }
    }
}
