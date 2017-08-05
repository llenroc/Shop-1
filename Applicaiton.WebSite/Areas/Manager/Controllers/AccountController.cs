using Application.Authorization;
using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.MultiTenancy;
using Application.Notifications;
using Application.Web;
using Application.WebSite.Authorization;
using Application.WebSite.Controllers;
using Application.WebSite.MultiTenancy;
using Infrastructure.Configuration.Startup;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Notifications;
using Infrastructure.Runtime.Caching;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Manager.Controllers
{
    public class AccountController :  AccountControllerBase
    {
        public AccountController(
            TenantManager tenantManager,
            UserManager userManager,
            RoleManager roleManager,
            LogInManager logInManager,
            ApplicationSignInManager signInManager,
            IUserEmailer userEmailer,
            IUnitOfWorkManager unitOfWorkManager,
            ITenancyNameFinder tenancyNameFinder,
            IMultiTenancyConfig multiTenancyConfig,
            IAppNotifier appNotifier,
            IWebUrlService webUrlService,
            IUserLinkManager userLinkManager,
            INotificationSubscriptionManager notificationSubscriptionManager,
            ICacheManager cacheManager,
            LoginResultTypeHelper _loginResultTypeHelper
            ) : base(
                tenantManager,
                userManager,
                roleManager,
                logInManager,
                signInManager,
                userEmailer,
                unitOfWorkManager,
                tenancyNameFinder,
                multiTenancyConfig,
                appNotifier,
                webUrlService,
                _loginResultTypeHelper,
                userLinkManager,
                notificationSubscriptionManager,
                cacheManager)
        {
        }
    }
}