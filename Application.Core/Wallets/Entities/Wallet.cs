using Application.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Wallets.Entities
{
    public class Wallet:FullAuditedEntity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }

        public long UserId { get; set; }

        public string PayPassword { get; set; }

        public decimal Money { get; set; }

        public string Name { get; set; }
    }
}
