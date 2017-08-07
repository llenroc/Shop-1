using Application.Distributions;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(ChannelAgentProductDistribution))]
    public class ChannelAgentProductDistributionDto
    {
        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
