using Application.AreaAgents;
using Application.Channel.ChannelAgents;
using Application.Distributions;
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

        public virtual ICollection<OrderChannelAgentProductDistribution> OrderChannelAgentProductDistributions { get; set; }

        public virtual ICollection<OrderDistribution> OrderDistributions { get; set; }

        public virtual ICollection<OrderAreaAgentDistribution> OrderAreaAgentDistributions { get; set; }

        public virtual ICollection<OrderChannelAgentDistribution> OrderChannelAgentDistributions { get; set; }

        public virtual ICollection<AreaAgentRebate> AreaAgentRebates { get; set; }

        public virtual ICollection<ChannelAgentRebate> ChannelAgentRebates { get; set; }
    }
}
