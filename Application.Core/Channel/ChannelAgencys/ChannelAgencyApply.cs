using Application.Agents;
using Application.Channel.ChannelAgents;
using System.ComponentModel.DataAnnotations;

namespace Application.Channel.ChannelAgencies
{
    public class ChannelAgencyApply : AgencyApplyBase
    {
        public int OrderId { get; set; }

        [Required]
        public int ChannelAgentId { get; set; }

        public virtual ChannelAgent ChannelAgent { get; set; }
    }
}
