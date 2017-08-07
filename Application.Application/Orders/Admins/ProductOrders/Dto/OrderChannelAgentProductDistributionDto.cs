using Application.Distributions;
using Application.Group.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(OrderChannelAgentProductDistribution))]
    public class OrderChannelAgentProductDistributionDto
    {
        public decimal Money { get; set; }

        public CustomerDto User { get; set; }

        public ChannelAgentProductDistributionDto Distribution { get; set; }
    }
}
