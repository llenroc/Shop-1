using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.MultiTenancy;
using Infrastructure.Authorization;
using Infrastructure.Configuration;
using Infrastructure.Domain.UnitOfWork;
using Microsoft.Owin.Security;

namespace Application.WebSite.Authorization
{
    public class ApplicationSignInManager : CommonFrameSignInManager<Tenant, Role, User>
    {
        public ApplicationSignInManager(
            UserManager userManager,
            IAuthenticationManager authenticationManager,
            ISettingManager settingManager,
            IUnitOfWorkManager unitOfWorkManager) 
            : base(
                  userManager, 
                  authenticationManager,
                  settingManager,
                  unitOfWorkManager)
        {
        }
    }
}