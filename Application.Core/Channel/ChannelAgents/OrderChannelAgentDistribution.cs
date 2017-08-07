using Application.Authorization.Users;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;

namespace Application.Channel.ChannelAgents
{
    public class OrderChannelAgentDistribution : AuditedEntity
    {
        [Required]
        public int OrderId { get; set; }

        public virtual ChannelAgencyApplyOrder Order { get; set; }

        [Required]
        public decimal OrderMoney { get; set; }

        [Required]
        public decimal Money { get; set; }

        [Required]
        public long UserId { get; set; }

        public virtual User User { get; set; }

        [Required]
        public int DistributionId { get; set; }

        public virtual ChannelAgentDistribution Distribution { get; set; }
    }
}
