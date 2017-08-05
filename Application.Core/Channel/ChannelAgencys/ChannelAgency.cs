using Application.Agents;
using Application.Channel.ChannelAgents;
using System.ComponentModel.DataAnnotations;

namespace Application.Channel.ChannelAgencies
{
    public class ChannelAgency : AgencyBase
    {
        [Required]
        public int ChannelAgentId { get; set; }

        public virtual ChannelAgent ChannelAgent { get; set; }

        public int Depth { get; set; }

        public int ChildCount { get; set; }

        public float RebateRatio { get; set; }
    }
}
