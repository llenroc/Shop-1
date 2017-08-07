using Application.Channel.ChannelAgents;
using Application.Group.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(OrderChannelAgentDistribution))]
    public class OrderChannelAgentDistributionDto
    {
        public decimal Money { get; set; }

        public CustomerDto User { get; set; }

        public ChannelAgentDistribution Distribution { get; set; }
    }
}
