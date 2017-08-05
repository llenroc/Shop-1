using Application.Channel.ChannelAgents;
using Infrastructure.AutoMapper;
using Infrastructure.Application.DTO;

namespace Application.Channel.Front.Dto
{
    [AutoMap(typeof(ChannelAgentRebate))]
    public class ChannelAgentRebateDto:AuditedEntityDto
    {
        public int OrderId { get; set; }

        public ChannelAgentRebateOrderDto Order { get; set; }

        public ChannelAgent ChannelAgentDto { get; set; }

        public long UserId { get; set; }

        public int ChannlAgencyId { get; set; }

        public int ChannelAgentId { get; set; }

        public float RebateRatio { get; set; }

        public int Depth { get; set; }

        public decimal Money { get; set; }
    }
}
