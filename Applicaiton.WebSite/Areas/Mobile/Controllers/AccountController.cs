using Application.Authorization;
using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.MultiTenancy;
using Application.Notifications;
using Application.Web;
using Application.WebSite.Authorization;
using Application.WebSite.Controllers;
using Application.WebSite.Models.Account;
using Application.WebSite.MultiTenancy;
using Application.Wechats;
using Infrastructure.Authorization.Users;
using Infrastructure.AutoMapper;
using Infrastructure.Configuration.Startup;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Extensions;
using Infrastructure.Notifications;
using Infrastructure.Runtime.Caching;
using Infrastructure.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Weixin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class AccountController : AccountControllerBase
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

        [HttpPost]
        [UnitOfWork]
        public override async Task<ActionResult> Register(RegisterViewModel model)
        {
            try
            {
                CheckModelState();

                //Get tenancy name and tenant
                if (!_multiTenancyConfig.IsEnabled)
                {
                    model.TenancyName = Tenant.DefaultTenantName;
                }
                else if (model.TenancyName.IsNullOrEmpty())
                {
                    throw new UserFriendlyException(L("TenantNameCanNotBeEmpty"));
                }
                var tenant = await GetActiveTenantAsync(model.TenancyName);

                //Create user
                var user = new User
                {
                    TenantId = tenant.Id,
                    Name = model.Name,
                    Surname = model.Surname,
                    NickName=model.NickName,
                    EmailAddress = model.EmailAddress,
                    IsActive = true
                };

                //Get external login info if possible
                ExternalLoginInfo externalLoginInfo = null;

                if (model.IsExternalLogin)
                {
                    externalLoginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();

                    if (externalLoginInfo == null)
                    {
                        throw new ApplicationException(L("CanNotExternalLogin"));
                    }
                    user.Avatar=externalLoginInfo.ExternalIdentity.Claims.FirstOrDefault(c => c.Type == CommonClaimType.Avatar).Value;

                    string userInfoString = externalLoginInfo.ExternalIdentity.Claims.FirstOrDefault(c => c.Type == WeixinSecurityConstants.WeixinClaimType).Value;
                    user.WechatUserInfo = new WechatUserInfo(userInfoString);

                    user.Logins = new List<UserLogin>
                    {
                        new UserLogin
                        {
                            TenantId = tenant.Id,
                            LoginProvider = externalLoginInfo.Login.LoginProvider,
                            ProviderKey = externalLoginInfo.Login.ProviderKey
                        }
                    };

                    if (externalLoginInfo.Login.LoginProvider == "Weixin")
                    {
                        user.Source = UserSource.WeixinExternalLogin;
                    }
                    else
                    {
                        user.Source = UserSource.OtherExternalLogin;
                    }

                    if (model.UserName.IsNullOrEmpty())
                    {
                        model.UserName = externalLoginInfo.ExternalIdentity.Claims.Where(c=>c.Type==ClaimTypes.NameIdentifier).FirstOrDefault().Value;
                    }
                    model.Password = Application.Authorization.Users.User.DefaultPassword;
                }
                else
                {
                    //Username and Password are required if not external login
                    if (model.UserName.IsNullOrEmpty() || model.Password.IsNullOrEmpty())
                    {
                        throw new UserFriendlyException(L("FormIsNotValidMessage"));
                    }
                }
                user.UserName = model.UserName;
                user.Password = new PasswordHasher().HashPassword(model.Password);

                //Switch to the tenant
                _unitOfWorkManager.Current.EnableFilter(DataFilters.MayHaveTenant); //TODO: Needed?
                _unitOfWorkManager.Current.SetTenantId(tenant.Id);

                //Add default roles
                user.Roles = new List<UserRole>();

                foreach (var defaultRole in await _roleManager.GetDefaultRoles())
                {
                    user.Roles.Add(new UserRole { RoleId = defaultRole.Id });
                }

                //Save user
                CheckErrors(await _userManager.CreateAsync(user));
                await _unitOfWorkManager.Current.SaveChangesAsync();

                //Notifications
                await _notificationSubscriptionManager.SubscribeToAllAvailableNotificationsAsync(user.ToUserIdentifier());
                //await _appNotifier.WelcomeToTheApplicationAsync(user);
                //await _appNotifier.NewUserRegisteredAsync(user);

                //Directly login if possible
                if (user.IsActive)
                {
                    LoginResult<Tenant, User> loginResult;

                    if (externalLoginInfo != null)
                    {
                        loginResult = await _logInManager.LoginAsync(externalLoginInfo.Login, tenant.TenancyName);
                    }
                    else
                    {
                        loginResult = await GetLoginResultAsync(user.UserName, model.Password, tenant.TenancyName);
                    }

                    if (loginResult.Result == LoginResultType.Success)
                    {
                        await SignInAsync(loginResult.User, loginResult.Identity);
                        return Redirect(Url.Action("Index", "Home"));
                    }
                    Logger.Warn("New registered user could not be login. This should not be normally. login result: " + loginResult.Result);
                }

                //If can not login, show a register result page
                return View("RegisterResult", new RegisterResultViewModel
                {
                    TenancyName = tenant.TenancyName,
                    NameAndSurname = user.Name + " " + user.Surname,
                    UserName = user.UserName,
                    EmailAddress = user.EmailAddress,
                    IsActive = user.IsActive
                });
            }
            catch (UserFriendlyException ex)
            {
                ViewBag.IsMultiTenancyEnabled = _multiTenancyConfig.IsEnabled;
                ViewBag.ErrorMessage = ex.Message;

                return View("Register", model);
            }
        }

        [UnitOfWork]
        public override async Task<ActionResult> ExternalLoginCallback(string returnUrl, string tenancyName = "")
        {
            ExternalLoginInfo loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();

            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }
           
            //Try to find tenancy name
            if (tenancyName.IsNullOrEmpty())
            {
                var tenants = await FindPossibleTenantsOfUserAsync(loginInfo.Login);
                
                switch (tenants.Count)
                {
                    case 0:
                        tenancyName = _tenancyNameFinder.GetCurrentTenancyNameOrNull();

                        if (string.IsNullOrEmpty(tenancyName))
                        {
                            return await RegisterView(loginInfo);
                        }
                        break;
                    case 1:
                        tenancyName = tenants[0].TenancyName;
                        break;
                    default:
                        return View("TenantSelection", new TenantSelectionViewModel
                        {
                            Action = Url.Action("ExternalLoginCallback", "Account", new { returnUrl }),
                            Tenants = tenants.MapTo<List<TenantSelectionViewModel.TenantInfo>>()
                        });
                }
            }
            var loginResult = await _logInManager.LoginAsync(loginInfo.Login, tenancyName);

            switch (loginResult.Result)
            {
                case LoginResultType.Success:
                    await SignInAsync(loginResult.User, loginResult.Identity, false);
                    await UpdateUser(loginInfo,tenancyName);

                    if (string.IsNullOrWhiteSpace(returnUrl))
                    {
                        returnUrl = Url.Action("Index", "Home");
                    }
                    return Redirect(returnUrl);
                case LoginResultType.UnknownExternalLogin:
                    return await RegisterView(loginInfo, tenancyName);
                default:
                    throw _loginResultTypeHelper.CreateExceptionForFailedLoginAttempt(loginResult.Result, loginInfo.Email ?? loginInfo.DefaultUserName, tenancyName);
            }
        }

        private async Task UpdateUser(ExternalLoginInfo loginInfo,string tenancyName)
        {
            string nickName= loginInfo.ExternalIdentity.Claims.Where(c => c.Type == CommonClaimType.NickName).FirstOrDefault().Value;
            string avatar = loginInfo.ExternalIdentity.Claims.Where(model => model.Type == CommonClaimType.Avatar).FirstOrDefault().Value;

            if (!string.IsNullOrEmpty(nickName) || !string.IsNullOrEmpty(avatar))
            {
                Tenant tenant = await _tenantManager.FindByTenancyNameAsync(tenancyName);

                using (CurrentUnitOfWork.SetTenantId(tenant.Id))
                {
                    var user = await _userManager.Store.FindAsync(tenant.Id, loginInfo.Login);
                    user.NickName = loginInfo.ExternalIdentity.Claims.Where(c => c.Type == CommonClaimType.NickName).FirstOrDefault().Value;
                    user.Avatar = loginInfo.ExternalIdentity.Claims.Where(model => model.Type == CommonClaimType.Avatar).FirstOrDefault().Value;

                    string userInfoString = loginInfo.ExternalIdentity.Claims.FirstOrDefault(c => c.Type == WeixinSecurityConstants.WeixinClaimType).Value;

                    WechatUserInfo wechatUserInfo = new WechatUserInfo(userInfoString);

                    if (user.WechatUserInfo == null)
                    {
                        user.WechatUserInfo = wechatUserInfo;
                    }
                    else
                    {
                        user.WechatUserInfo.Nickame = wechatUserInfo.Nickame;
                        user.WechatUserInfo.HeadimgUrl = wechatUserInfo.HeadimgUrl;
                    }
                    await _userManager.Store.UpdateAsync(user);
                }
            }
        }

        protected override async Task<ActionResult> RegisterView(ExternalLoginInfo loginInfo, string tenancyName = null)
        {
            var name = loginInfo.DefaultUserName;
            var surname = loginInfo.DefaultUserName;

            var viewModel = new RegisterViewModel
            {
                TenancyName = tenancyName,
                EmailAddress = loginInfo.Email,
                Name = loginInfo.ExternalIdentity.Claims.Where(c => c.Type == ClaimTypes.Name).FirstOrDefault().Value,
                Surname = loginInfo.ExternalIdentity.Claims.Where(c => c.Type == ClaimTypes.NameIdentifier).FirstOrDefault().Value,
                NickName = loginInfo.ExternalIdentity.Claims.Where(c => c.Type == CommonClaimType.NickName).FirstOrDefault().Value,
                Avatar =loginInfo.ExternalIdentity.Claims.Where(model=>model.Type==CommonClaimType.Avatar).FirstOrDefault().Value,
                IsExternalLogin = true
            };

            if (!tenancyName.IsNullOrEmpty())
            {
                return await Register(viewModel);
            }
            return RegisterView(viewModel);
        }
    }
}