using Application.Products.Orders.Entities;

namespace Application.AgentOrders.Entities
{
    public class AgentOrder : ProductOrder
    {
        public AgentOrder()
        {
            DisableChannelAgentProductDistribution = true;
        }
    }
}
