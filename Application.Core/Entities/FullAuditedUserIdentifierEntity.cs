using Application.Authorization.Users;
using Infrastructure;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Entities
{
    public class FullAuditedUserIdentifierEntity : FullAuditedEntity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }

        public long UserId { get; set; }

        public virtual User User { get;set;}

        public FullAuditedUserIdentifierEntity()
        {

        }

        public FullAuditedUserIdentifierEntity(UserIdentifier userIdentifier)
        {
            TenantId = userIdentifier.TenantId.Value;
            UserId = userIdentifier.UserId;
        }

        public UserIdentifier GetUserIdentifier()
        {
            return new UserIdentifier(TenantId, UserId);
        }
    }
}
