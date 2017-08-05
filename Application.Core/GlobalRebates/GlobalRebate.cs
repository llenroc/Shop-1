using Application.Authorization.Users;
using Application.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.GlobalRebates
{
    public class GlobalRebate:FullAuditedEntity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }

        public long UserId { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }

        public virtual User User { get; set; }
    }
}
