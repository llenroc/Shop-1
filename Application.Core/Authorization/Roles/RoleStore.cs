using Infrastructure.Authorization.Roles;
using Infrastructure.Authorization.Users;
using Infrastructure.Domain.Repositories;
using Application.Authorization.Users;

namespace Application.Authorization.Roles
{
    public class RoleStore : CommonFrameRoleStore<Role, User>
    {
        public RoleStore(
            IRepository<Role> roleRepository,
            IRepository<UserRole, long> userRoleRepository,
            IRepository<RolePermissionSetting, long> rolePermissionSettingRepository)
            : base( roleRepository,userRoleRepository, rolePermissionSettingRepository)
        {
        }
    }
}