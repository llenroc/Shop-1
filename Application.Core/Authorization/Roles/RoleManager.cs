using Infrastructure.Authorization;
using Infrastructure.Authorization.Roles;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Runtime.Caching;
using Infrastructure.CommonFrame.Configuration;
using Application.Authorization.Users;
using System.Linq;
using System.Data.Entity;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Authorization.Roles
{
    public class RoleManager : CommonFrameRoleManager<Role, User>
    {
        public RoleManager(
            RoleStore store,
            IPermissionManager permissionManager,
            IRoleManagementConfig roleManagementConfig,
            ICacheManager cacheManager,
            IUnitOfWorkManager unitOfWorkManager)
            : base(
                store,
                permissionManager,
                roleManagementConfig,
                cacheManager,
                unitOfWorkManager)
        {
        }

        public Task<List<Role>> GetDefaultRoles()
        {
            return Roles.Where(r => r.IsDefault).ToListAsync();
        }
    }
}