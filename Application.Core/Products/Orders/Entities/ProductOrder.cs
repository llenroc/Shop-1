using Application.Orders.Entities;
using System.Collections.Generic;

namespace Application.Products.Orders.Entities
{
    public class ProductOrder:Order
    {
        public string GetProductInfo()
        {
            string productInfo = "";
            int index = 0;

            foreach (OrderItem orderItem in OrderItems)
            {
                productInfo += orderItem.Specification.GetFullName() + "———" + orderItem.Count;

                if (index > 0)
                {
                    productInfo += "\n";
                }
                index++;
            }
            return productInfo;
        }

        public virtual ICollection<OrderItem> OrderItems { get; set; }

        public decimal ChannelAgentRebate { get; set; }

        public bool DisableProductRebate { get; set; }

        public bool DisableChannelAgentProductDistribution { get; set; }
    }
}
