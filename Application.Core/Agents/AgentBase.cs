using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Agents
{
    public class AgentBase : FullAuditedEntity, IMustHaveTenant
    {
        public int TenantId { get; set; }

        public string Name { get; set; }

        public int? PictureTemplateId { get; set; }

        public decimal MinAgentOrderMoney { get; set; }
    }
}
