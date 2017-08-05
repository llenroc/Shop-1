using Application.Channel.ChannelAgents;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Channel.End.Dto
{
    [AutoMapTo(typeof(ChannelAgentDistribution))]
    public class ChannelAgentDistributionCreateOrEditInput : NullableIdDto
    {
        public int? ChannelAgentId { get; set; }

        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }

        public float NonAgencyRatio { get; set; }
    }
}
