using Application.Authorization.Users;
using Application.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Agents
{
    public class AgencyBase : FullAuditedEntity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }

        public string Number { get; set; }

        public long UserId { get; set; }

        public virtual User User { get; set; }
    }
}
