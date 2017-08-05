using Infrastructure.Authorization;
using Application.Authorization.Roles;
using Application.MultiTenancy;
using Application.Authorization.Users;

namespace Application.Authorization
{
    public class PermissionChecker : PermissionChecker<Tenant, Role, User>
    {
        public PermissionChecker(UserManager userManager) : base(userManager)
        {

        }
    }
}
