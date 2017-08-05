using Infrastructure;
using Infrastructure.Domain.Entities;

namespace Application.Entities
{
    public class UserIdentifierEntity:Entity,IUserIdentifierEntity
    {
        public int TenantId { get; set; }

        public long UserId { get; set; }

        public UserIdentifierEntity()
        {

        }

        public UserIdentifierEntity(UserIdentifier userIdentifier)
        {
            TenantId = userIdentifier.TenantId.Value;
            UserId = userIdentifier.UserId;
        }

        public UserIdentifier GetUserIdentifier()
        {
            return new UserIdentifier(TenantId,UserId);
        }
    }
}
