using Infrastructure;

namespace Application.Entities
{
    public static class UserIdentifierEntityExtension
    {
        public static UserIdentifier GetUserIdentifier(this IUserIdentifierEntity entity)
        {
            return new UserIdentifier(entity.TenantId, entity.UserId);
        }
    }
}
