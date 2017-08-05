using Application.Distributions;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(ChannelAgentProductDistribution))]
    public class ChannelAgentProductDistributionDto : EntityDto
    {
        public int ProductId { get; set; }

        public int Level { get; set; }

        public int? MinChannelAgentLevel { get; set; }

        public int? MaxChannelAgentLevel { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
