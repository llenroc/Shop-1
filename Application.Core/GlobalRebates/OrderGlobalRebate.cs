using Application.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.GlobalRebates
{
    public class OrderGlobalRebate:AuditedEntity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }
        public long UserId { get; set; }
        public int OrderId { get; set; }
        public decimal Money { get; set; }
    }
}