using Application.Channel.ChannelAgents;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Channel.Front.Dto
{
    [AutoMap(typeof(ChannelAgentDistribution))]
    public class ChannelAgentDistributionDto : EntityDto
    {
        public int ChannelAgentId { get; set; }

        [Required]
        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }

        public float NonAgencyRatio { get; set; }
    }
}
