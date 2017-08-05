using Infrastructure.Domain.Entities.Auditing;
using System.Collections.Generic;

namespace Application.ShopCarts
{
    public class ShopCart:AuditedEntity
    {
        public long UserId { get; set; }

        public virtual ICollection<ShopCartItem> ShopCartItems{get;set;}

        public ShopCart()
        {
            ShopCartItems = new List<ShopCartItem>();
        }
    }
}
