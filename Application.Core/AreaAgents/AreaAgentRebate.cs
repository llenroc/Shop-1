using Application.Products.Orders.Entities;
using Infrastructure.Domain.Entities;

namespace Application.AreaAgents
{
    public enum AreaAgentOrderRebateType
    {
        Direct,
        Indirect
    }

    public class AreaAgentRebate : Entity
    {
        public int AreaAgentId { get; set; }

        public virtual AreaAgent AreaAgent { get; set; }

        public int AreaAgencyId { get; set; }

        public AreaAgentOrderRebateType AreaAgentOrderRebateType { get; set; }

        public decimal Money { get; set; }

        public int OrderId { get; set; }

        public string Remark { get; set; }

        public virtual ProductOrder Order { get; set; }

        public long UserId { get; set; }

        public long BuyerUserId { get; set; }

        public bool IsIndirectRebate { get; set; }
    }
}
