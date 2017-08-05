using Application.AgentOrders.Entities;
using Application.AreaAgents;
using Application.Channel.ChannelAgencies;
using Application.Products.Orders;
using System.Collections.Generic;

namespace Application.AgentOrders
{
    public class AgentOrderBoughtContext : ProductBoughtContext<AgentOrder>
    {
        public List<AreaAgency> AreaAgencys { get; set; }

        public ChannelAgency ChannelAgency { get; set; }

        public float Discount { get; set; }

        public AgentOrderBoughtContext()
        {
            Discount = 1;
        }
    }
}
