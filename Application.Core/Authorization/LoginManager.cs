using Infrastructure.Authorization;
using Infrastructure.Authorization.Users;
using Infrastructure.Configuration;
using Infrastructure.Configuration.Startup;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.CommonFrame.Configuration;
using Application.Authorization.Roles;
using Application.MultiTenancy;
using Application.Authorization.Users;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using System.Transactions;

namespace Application.Authorization
{
    public class LogInManager : LogInManager<Tenant, Role, User>
    {
        public LogInManager(
            UserManager userManager,
            IMultiTenancyConfig multiTenancyConfig,
            IRepository<Tenant> tenantRepository,
            IUnitOfWorkManager unitOfWorkManager,
            ISettingManager settingManager,
            IRepository<UserLoginAttempt, long> userLoginAttemptRepository,
            IUserManagementConfig userManagementConfig, IIocResolver iocResolver,
            RoleManager roleManager)
            : base(
                  userManager,
                  multiTenancyConfig,
                  tenantRepository,
                  unitOfWorkManager,
                  settingManager,
                  userLoginAttemptRepository,
                  userManagementConfig,
                  iocResolver,
                  roleManager)
        {
        }

        public override async Task<LoginResult<Tenant, User>> LoginAsync(UserLoginInfo login, string tenancyName = null)
        {
            var loginResult=await base.LoginAsync(login,tenancyName);
            await SaveUserLastLoginLocation(loginResult);
            return loginResult;
        }

        public override async Task<LoginResult<Tenant, User>> LoginAsync(string userNameOrEmailAddress, string plainPassword, string tenancyName = null, bool shouldLockout = true)
        {
            var loginResult = await base.LoginAsync(userNameOrEmailAddress, plainPassword, tenancyName,shouldLockout);
            await SaveUserLastLoginLocation(loginResult);
            return loginResult;
        }

        protected async Task SaveUserLastLoginLocation(LoginResult<Tenant, User> loginResult)
        {
            if (loginResult.User != null)
            {
                var tenantId = loginResult.Tenant != null ? loginResult.Tenant.Id : (int?)null;

                using (_unitOfWorkManager.Current.SetTenantId(tenantId))
                {
                    loginResult.User.LastLoginIp = ClientInfoProvider.ClientIpAddress;
                    await _userManager.Store.UpdateAsync(loginResult.User);
                }
            }
        }
    }
}
