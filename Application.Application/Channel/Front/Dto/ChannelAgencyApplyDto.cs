using Application.Channel.ChannelAgencies;
using Infrastructure.AutoMapper;
using Infrastructure.Application.DTO;
using Application.Agents;

namespace Application.Channel.Front.Dto
{
    [AutoMap(typeof(ChannelAgencyApply))]
    public class ChannelAgencyApplyDto:FullAuditedEntityDto
    {
        public int OrderId { get; set; }

        public ChannelAgentDto ChannelAgent { get; set; }

        public long UserId { get; set; }

        public int ChannelAgentId { get; set; }

        public AgencyApplyStatus Status { get; set; }
    }
}
