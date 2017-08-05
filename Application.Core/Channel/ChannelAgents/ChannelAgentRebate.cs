using Application.Products.Orders.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Channel.ChannelAgents
{
    public class ChannelAgentRebate:FullAuditedEntity
    {
        public int OrderId { get; set; }

        public virtual ProductOrder Order { get; set; }

        public virtual ChannelAgent ChannelAgent { get; set; }

        public long UserId { get; set; }

        public int ChannlAgencyId { get; set; }

        public int ChannelAgentId { get; set; }

        public float RebateRatio { get; set; }

        public int Depth { get; set; }

        public decimal Money { get; set; }
    }
}
