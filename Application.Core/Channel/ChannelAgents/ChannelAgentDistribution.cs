using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;

namespace Application.Channel.ChannelAgents
{
    public class ChannelAgentDistribution : Entity
    {
        public int ChannelAgentId { get; set; }

        [Required]
        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }

        [Range(0,1)]
        public float NonAgencyRatio { get; set; }
    }
}
