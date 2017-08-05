using Application.Distributions;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Tenants.Dto
{
    [AutoMapTo(typeof(ChannelAgentProductDistribution))]
    public class ChannelAgentProductDistributionCreateOrEditInput : NullableIdDto
    {
        public int? ProductId { get; set; }

        public int Level { get; set; }

        public int? MinChannelAgentLevel { get; set; }

        public int? MaxChannelAgentLevel { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
