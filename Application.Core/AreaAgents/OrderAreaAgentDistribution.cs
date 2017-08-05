using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;

namespace Application.AreaAgents
{
    public class OrderAreaAgentDistribution : AuditedEntity
    {
        [Required]
        public int OrderId { get; set; }

        public virtual AreaAgencyApplyOrder Order { get; set; }

        [Required]
        public decimal OrderMoney { get; set; }

        [Required]
        public decimal Money { get; set; }

        [Required]
        public long UserId { get; set; }

        [Required]
        public int DistributionId { get; set; }

        public virtual AreaAgentDistribution Distribution { get; set; }
    }
}
