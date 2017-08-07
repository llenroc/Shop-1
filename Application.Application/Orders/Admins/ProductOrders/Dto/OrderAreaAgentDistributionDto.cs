using Application.AreaAgents;
using Application.Group.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(OrderAreaAgentDistribution))]
    public class OrderAreaAgentDistributionDto
    {
        public decimal Money { get; set; }

        public CustomerDto User { get; set; }

        public virtual AreaAgentDistribution Distribution { get; set; }
    }
}
