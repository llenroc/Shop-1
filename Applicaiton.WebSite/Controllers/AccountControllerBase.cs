using Application.Authorization;
using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.Configuration;
using Application.MultiTenancy;
using Application.Notifications;
using Application.Security;
using Application.Web;
using Application.WebSite.Authorization;
using Application.WebSite.Controllers.Results;
using Application.WebSite.Models.Account;
using Application.WebSite.MultiTenancy;
using Infrastructure.Authorization.Users;
using Infrastructure.AutoMapper;
using Infrastructure.Configuration;
using Infrastructure.Configuration.Startup;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Extensions;
using Infrastructure.Notifications;
using Infrastructure.Runtime.Caching;
using Infrastructure.Runtime.Security;
using Infrastructure.Runtime.Session;
using Infrastructure.Threading;
using Infrastructure.Timing;
using Infrastructure.UI;
using Infrastructure.Web.Models;
using Infrastructure.Web.Mvc.Authorization;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Controllers
{
    public class AccountControllerBase : AnonymousHomeControllerBase
    {
        protected readonly TenantManager _tenantManager;
        protected readonly UserManager _userManager;
        protected readonly RoleManager _roleManager;
        protected readonly LogInManager _logInManager;
        protected readonly ApplicationSignInManager _signInManager;
        protected readonly LoginResultTypeHelper _loginResultTypeHelper;

        protected readonly IUnitOfWorkManager _unitOfWorkManager;
        protected readonly IUserEmailer _userEmailer;
        protected readonly IMultiTenancyConfig _multiTenancyConfig;
        protected readonly IWebUrlService _webUrlService;
        protected readonly ITenancyNameFinder _tenancyNameFinder;
        protected readonly ICacheManager _cacheManager;

        protected readonly IAppNotifier _appNotifier;
        private readonly IUserLinkManager _userLinkManager;
        protected readonly INotificationSubscriptionManager _notificationSubscriptionManager;

        protected IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        public AccountControllerBase(
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
            LoginResultTypeHelper loginResultTypeHelper,
            IUserLinkManager userLinkManager,
            INotificationSubscriptionManager notificationSubscriptionManager,
            ICacheManager cacheManager
            )
        {
            _tenantManager = tenantManager;
            _userManager = userManager;
            _roleManager = roleManager;
            _unitOfWorkManager = unitOfWorkManager;
            _tenancyNameFinder = tenancyNameFinder;
            _multiTenancyConfig = multiTenancyConfig;
            _userEmailer = userEmailer;
            _logInManager = logInManager;
            _signInManager = signInManager;
            _appNotifier = appNotifier;
            _userLinkManager = userLinkManager;
            _notificationSubscriptionManager = notificationSubscriptionManager;
            _cacheManager = cacheManager;
            _webUrlService = webUrlService;
            _loginResultTypeHelper = loginResultTypeHelper;
        }

        public ActionResult Login(string userNameOrEmailAddress = "", string returnUrl = "")
        {
            if (string.IsNullOrWhiteSpace(returnUrl))
            {
                returnUrl = Url.Action("Index", "Home");
            }

            return View(
                new LoginFormViewModel
                {
                    TenancyName = _tenancyNameFinder.GetCurrentTenancyNameOrNull(),
                    IsSelfRegistrationEnabled = IsSelfRegistrationEnabled(),
                    ReturnUrl = returnUrl,
                    IsMultiTenancyEnabled = _multiTenancyConfig.IsEnabled,
                    UserNameOrEmailAddress = userNameOrEmailAddress
                });
        }

        [HttpPost]
        [UnitOfWork]
        public virtual async Task<JsonResult> Login(LoginViewModel loginModel, string returnUrl = "", string returnUrlHash = "")
        {
            var loginResult = await GetLoginResultAsync(loginModel.UsernameOrEmailAddress, loginModel.Password, loginModel.TenancyName);
            var tenantId = loginResult.Tenant == null ? (int?)null : loginResult.Tenant.Id;

            using (UnitOfWorkManager.Current.SetTenantId(tenantId))
            {
                if (loginResult.User.ShouldChangePasswordOnNextLogin)
                {
                    loginResult.User.SetNewPasswordResetCode();

                    return Json(new AjaxResponse
                    {
                        TargetUrl = Url.Action(
                            "ResetPassword",
                            new ResetPasswordViewModel
                            {
                                TenantId = SimpleStringCipher.Instance.Encrypt(tenantId == null ? null : tenantId.ToString()),
                                UserId = SimpleStringCipher.Instance.Encrypt(loginResult.User.Id.ToString()),
                                ResetCode = loginResult.User.PasswordResetCode
                            })
                    });
                }
            }
            await SignInAsync(loginResult.User, loginResult.Identity, loginModel.RememberMe);
            await UnitOfWorkManager.Current.SaveChangesAsync();

            if (string.IsNullOrWhiteSpace(returnUrl))
            {
                returnUrl = Url.Action("Index", "Home");
            }

            if (string.IsNullOrWhiteSpace(returnUrl))
            {
                returnUrl = Request.ApplicationPath;
            }

            if (!string.IsNullOrWhiteSpace(returnUrlHash))
            {
                returnUrl = returnUrl + returnUrlHash;
            }
            return Json(new AjaxResponse { TargetUrl = returnUrl });
        }

        public async Task<JsonResult> CheckUsername(string UsernameOrEmailAddress)
        {
            User user = await _userManager.FindByNameOrEmailAsyncOfAll(UsernameOrEmailAddress);

            if (user == null)
            {
                return Json(new AjaxResponse(false));
            }
            else
            {
                return Json(new AjaxResponse(true));
            }
        }

        protected async Task SignInAsync(User user, ClaimsIdentity identity = null, bool rememberMe = false)
        {
            if (identity == null)
            {
                identity = await _userManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);
            }

            if (!String.IsNullOrEmpty(user.EmailAddress))
            {
                identity.AddClaim(new Claim(ClaimTypes.Email, user.EmailAddress));
            }
            identity.AddClaim(new Claim(ClaimTypes.Name, user.Name));
            identity.AddClaim(new Claim(ClaimTypes.Surname, user.Surname));

            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignIn(new AuthenticationProperties { IsPersistent = rememberMe }, identity);
        }

        protected async Task<LoginResult<Tenant, User>> GetLoginResultAsync(string usernameOrEmailAddress, string password, string tenancyName)
        {
            var loginResult = await _logInManager.LoginAsync(usernameOrEmailAddress, password, tenancyName);

            switch (loginResult.Result)
            {
                case LoginResultType.Success:
                    return loginResult;
                default:
                    throw _loginResultTypeHelper.CreateExceptionForFailedLoginAttempt(loginResult.Result, usernameOrEmailAddress, tenancyName);
            }
        }

        protected void CheckSelfRegistrationIsEnabled()
        {
            if (!IsSelfRegistrationEnabled())
            {
                throw new UserFriendlyException(L("SelfUserRegistrationIsDisabledMessage_Detail"));
            }
        }

        protected bool IsSelfRegistrationEnabled()
        {
            var tenancyName = _tenancyNameFinder.GetCurrentTenancyNameOrNull();

            if (tenancyName.IsNullOrEmpty())
            {
                return true;
            }
            var tenant = AsyncHelper.RunSync(() => GetActiveTenantAsync(tenancyName));
            return SettingManager.GetSettingValueForTenant<bool>(AppSettings.UserManagement.AllowSelfRegistration, tenant.Id);
        }

        protected async Task<User> GetUserByChecking(string emailAddress)
        {
            var user = await _userManager.GetUserByEmail(emailAddress);

            if (user == null)
            {
                throw new UserFriendlyException(L("InvalidEmailAddress"));
            }
            return user;
        }

        protected async Task<int?> GetTenantIdOrDefault(string tenancyName)
        {
            return tenancyName.IsNullOrEmpty() ? InfrastructureSession.TenantId : (await GetActiveTenantAsync(tenancyName)).Id;
        }

        protected async Task<Tenant> GetActiveTenantAsync(string tenancyName)
        {
            var tenant = await _tenantManager.FindByTenancyNameAsync(tenancyName);

            if (tenant == null)
            {
                throw new UserFriendlyException(L("ThereIsNoTenantDefinedWithName{0}", tenancyName));
            }

            if (!tenant.IsActive)
            {
                throw new UserFriendlyException(L("TenantIsNotActive", tenancyName));
            }
            return tenant;
        }

        [UnitOfWork]
        protected virtual async Task<List<Tenant>> FindPossibleTenantsOfUserAsync(UserLoginInfo login)
        {
            List<User> allUsers;

            using (_unitOfWorkManager.Current.DisableFilter(DataFilters.MayHaveTenant))
            {
                allUsers = await _userManager.FindAllAsync(login);
            }

            return allUsers
                .Where(u => u.TenantId != null)
                .Select(u => AsyncHelper.RunSync(() => _tenantManager.FindByIdAsync(u.TenantId.Value)))
                .ToList();
        }

        protected static bool TryExtractNameAndSurnameFromClaims(List<Claim> claims, ref string name, ref string surname)
        {
            string foundName = null;
            string foundSurname = null;

            var givennameClaim = claims.FirstOrDefault(c => c.Type == ClaimTypes.GivenName);

            if (givennameClaim != null && !givennameClaim.Value.IsNullOrEmpty())
            {
                foundName = givennameClaim.Value;
            }

            var surnameClaim = claims.FirstOrDefault(c => c.Type == ClaimTypes.Surname);

            if (surnameClaim != null && !surnameClaim.Value.IsNullOrEmpty())
            {
                foundSurname = surnameClaim.Value;
            }

            if (foundName == null || foundSurname == null)
            {
                var nameClaim = claims.FirstOrDefault(c => c.Type == ClaimTypes.Name);

                if (nameClaim != null)
                {
                    var nameSurName = nameClaim.Value;

                    if (!nameSurName.IsNullOrEmpty())
                    {
                        var lastSpaceIndex = nameSurName.LastIndexOf(' ');

                        if (lastSpaceIndex < 1 || lastSpaceIndex > (nameSurName.Length - 2))
                        {
                            foundName = foundSurname = nameSurName;
                        }
                        else
                        {
                            foundName = nameSurName.Substring(0, lastSpaceIndex);
                            foundSurname = nameSurName.Substring(lastSpaceIndex);
                        }
                    }
                }
            }

            if (!foundName.IsNullOrEmpty())
            {
                name = foundName;
            }

            if (!foundSurname.IsNullOrEmpty())
            {
                surname = foundSurname;
            }

            return foundName != null && foundSurname != null;
        }

        public virtual ActionResult Logout()
        {
            AuthenticationManager.SignOut();
            return RedirectToAction("Login");
        }

        public virtual ActionResult ForgotPassword()
        {
            ViewBag.IsMultiTenancyEnabled = _multiTenancyConfig.IsEnabled;
            ViewBag.TenancyName = _tenancyNameFinder.GetCurrentTenancyNameOrNull();
            return View();
        }

        [HttpPost]
        public virtual async Task<JsonResult> SendPasswordResetLink(SendPasswordResetLinkViewModel model)
        {
            UnitOfWorkManager.Current.SetTenantId(await GetTenantIdOrDefault(model.TenancyName));

            var user = await GetUserByChecking(model.EmailAddress);

            user.SetNewPasswordResetCode();
            await _userEmailer.SendPasswordResetLinkAsync(user);

            await UnitOfWorkManager.Current.SaveChangesAsync();

            return Json(new AjaxResponse());
        }

        public virtual async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            var tenantId = model.TenantId.IsNullOrEmpty() ? (int?)null : SimpleStringCipher.Instance.Decrypt(model.TenantId).To<int>();
            var userId = SimpleStringCipher.Instance.Decrypt(model.UserId).To<long>();

            _unitOfWorkManager.Current.SetTenantId(tenantId);

            var user = await _userManager.GetUserByIdAsync(userId);

            if (user == null || user.PasswordResetCode.IsNullOrEmpty() || user.PasswordResetCode != model.ResetCode)
            {
                throw new UserFriendlyException(L("InvalidPasswordResetCode"), L("InvalidPasswordResetCode_Detail"));
            }
            var setting = await SettingManager.GetSettingValueForUserAsync(AppSettings.Security.PasswordComplexity, tenantId, userId);
            model.PasswordComplexitySetting = JsonConvert.DeserializeObject<PasswordComplexitySetting>(setting);

            return View(model);
        }

        [HttpPost]
        public virtual async Task<ActionResult> ResetPassword(ResetPasswordFormViewModel model)
        {
            var tenantId = model.TenantId.IsNullOrEmpty() ? (int?)null : SimpleStringCipher.Instance.Decrypt(model.TenantId).To<int>();
            var userId = Convert.ToInt64(SimpleStringCipher.Instance.Decrypt(model.UserId));

            _unitOfWorkManager.Current.SetTenantId(tenantId);
            var user = await _userManager.GetUserByIdAsync(userId);

            if (user == null || user.PasswordResetCode.IsNullOrEmpty() || user.PasswordResetCode != model.ResetCode)
            {
                throw new UserFriendlyException(L("InvalidPasswordResetCode"), L("InvalidPasswordResetCode_Detail"));
            }
            user.Password = new PasswordHasher().HashPassword(model.Password);
            user.PasswordResetCode = null;
            user.IsEmailConfirmed = true;
            user.ShouldChangePasswordOnNextLogin = false;

            await _userManager.UpdateAsync(user);

            if (user.IsActive)
            {
                await SignInAsync(user);
            }
            return RedirectToAction("Index", "Home");
        }

        public virtual ActionResult EmailActivation()
        {
            ViewBag.IsMultiTenancyEnabled = _multiTenancyConfig.IsEnabled;
            ViewBag.TenancyName = _tenancyNameFinder.GetCurrentTenancyNameOrNull();

            return View();
        }

        [HttpPost]
        public virtual async Task<JsonResult> SendEmailActivationLink(SendEmailActivationLinkViewModel model)
        {
            var tenantId = await GetTenantIdOrDefault(model.TenancyName);

            UnitOfWorkManager.Current.SetTenantId(tenantId);

            var user = await GetUserByChecking(model.EmailAddress);

            user.SetNewEmailConfirmationCode();
            await _userEmailer.SendEmailActivationLinkAsync(user);

            return Json(new AjaxResponse());
        }

        public virtual async Task<ActionResult> EmailConfirmation(EmailConfirmationViewModel model)
        {
            var tenantId = model.TenantId.IsNullOrEmpty() ? (int?)null : SimpleStringCipher.Instance.Decrypt(model.TenantId).To<int>();
            var userId = Convert.ToInt64(SimpleStringCipher.Instance.Decrypt(model.UserId));

            _unitOfWorkManager.Current.SetTenantId(tenantId);

            var user = await _userManager.GetUserByIdAsync(userId);

            if (user == null || user.EmailConfirmationCode.IsNullOrEmpty() || user.EmailConfirmationCode != model.ConfirmationCode)
            {
                throw new UserFriendlyException(L("InvalidEmailConfirmationCode"), L("InvalidEmailConfirmationCode_Detail"));
            }
            user.IsEmailConfirmed = true;
            user.EmailConfirmationCode = null;

            await _userManager.UpdateAsync(user);

            var tenancyName = user.TenantId.HasValue
                ? (await _tenantManager.GetByIdAsync(user.TenantId.Value)).TenancyName
                : "";

            return RedirectToAction(
                "Login",
                new
                {
                    successMessage = L("YourEmailIsConfirmedMessage"),
                    tenancyName = tenancyName,
                    userNameOrEmailAddress = user.UserName
                });
        }

        #region Two Factor Auth

        public async Task<ActionResult> SendSecurityCode(string returnUrl, bool rememberMe)
        {
            var userId = await _signInManager.GetVerifiedUserIdAsync();

            if (userId <= 0)
            {
                return RedirectToAction("Login");
            }
            var tenantId = await _signInManager.GetVerifiedTenantIdAsync();

            using (UnitOfWorkManager.Current.SetTenantId(tenantId))
            {
                var userProviders = await _userManager.GetValidTwoFactorProvidersAsync(userId);

                var factorOptions = userProviders.Select(
                    userProvider =>
                        new SelectListItem
                        {
                            Text = userProvider,
                            Value = userProvider
                        }).ToList();

                return View(
                    new SendSecurityCodeViewModel
                    {
                        Providers = factorOptions,
                        ReturnUrl = returnUrl,
                        RememberMe = rememberMe
                    }
                );
            }
        }

        [HttpPost]
        public async Task<ActionResult> SendSecurityCode(SendSecurityCodeViewModel model)
        {
            var tenantId = await _signInManager.GetVerifiedTenantIdAsync();

            using (CurrentUnitOfWork.SetTenantId(tenantId))
            {
                if (!await _signInManager.SendTwoFactorCodeAsync(model.SelectedProvider))
                {
                    throw new UserFriendlyException(L("SendSecurityCodeErrorMessage"));
                }
                return RedirectToAction(
                    "VerifySecurityCode",
                    new
                    {
                        provider = model.SelectedProvider,
                        returnUrl = model.ReturnUrl,
                        rememberMe = model.RememberMe
                    }
                );
            }
        }

        public async Task<ActionResult> VerifySecurityCode(string provider, string returnUrl, bool rememberMe)
        {
            if (!await _signInManager.HasBeenVerifiedAsync())
            {
                throw new UserFriendlyException(L("VerifySecurityCodeNotLoggedInErrorMessage"));
            }

            return View(
                new VerifySecurityCodeViewModel
                {
                    Provider = provider,
                    ReturnUrl = returnUrl,
                    RememberMe = rememberMe,
                    IsRememberBrowserEnabled = true
                }
            );
        }

        [HttpPost]
        public async Task<JsonResult> VerifySecurityCode(VerifySecurityCodeViewModel model)
        {
            model.ReturnUrl = NormalizeReturnUrl(model.ReturnUrl);
            var tenantId = await _signInManager.GetVerifiedTenantIdAsync();

            using (CurrentUnitOfWork.SetTenantId(tenantId))
            {
                var result = await _signInManager.TwoFactorSignInAsync(
                    model.Provider,
                    model.Code,
                    isPersistent: model.RememberMe,
                    rememberBrowser: model.RememberBrowser
                );

                switch (result)
                {
                    case SignInStatus.Success:
                        return Json(new AjaxResponse { TargetUrl = model.ReturnUrl });
                    case SignInStatus.LockedOut:
                        throw new UserFriendlyException(L("UserLockedOutMessage"));
                    case SignInStatus.Failure:
                    default:
                        throw new UserFriendlyException(L("InvalidSecurityCode"));
                }
            }
        }

        #endregion

        //
        // GET: /Account/VerifyCode
        [AllowAnonymous]
        public virtual async Task<ActionResult> VerifyCode(string provider, string returnUrl, bool rememberMe)
        {
            // 要求用户已通过使用用户名/密码或外部登录名登录
            if (!await _signInManager.HasBeenVerifiedAsync())
            {
                return View("Error");
            }
            return View(new VerifyCodeViewModel { Provider = provider, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/VerifyCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public virtual async Task<ActionResult> VerifyCode(VerifyCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // 以下代码可以防范双重身份验证代码遭到暴力破解攻击。
            // 如果用户输入错误代码的次数达到指定的次数，则会将
            // 该用户帐户锁定指定的时间。
            // 可以在 IdentityConfig 中配置帐户锁定设置
            var result = await _signInManager.TwoFactorSignInAsync(model.Provider, model.Code, isPersistent: model.RememberMe, rememberBrowser: model.RememberBrowser);

            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(model.ReturnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "代码无效。");
                    return View(model);
            }
        }

        [AllowAnonymous]
        public virtual async Task<ActionResult> SendCode(string returnUrl, bool rememberMe)
        {
            var userId = await _signInManager.GetVerifiedUserIdAsync();
            var userFactors = await _userManager.GetValidTwoFactorProvidersAsync(userId);
            var factorOptions = userFactors.Select(purpose => new SelectListItem { Text = purpose, Value = purpose }).ToList();
            return View();
        }

        //
        // POST: /Account/SendCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public virtual async Task<ActionResult> SendCode(SendCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            // 生成令牌并发送该令牌
            if (!await _signInManager.SendTwoFactorCodeAsync(model.SelectedProvider))
            {
                return View("Error");
            }
            return RedirectToAction("VerifyCode", new { Provider = model.SelectedProvider, ReturnUrl = model.ReturnUrl, RememberMe = model.RememberMe });
        }

        public virtual ActionResult Register()
        {
            return RegisterView(new RegisterViewModel());
        }

        protected virtual ActionResult RegisterView(RegisterViewModel model)
        {
            if (string.IsNullOrEmpty(model.TenancyName))
            {
                model.TenancyName = _tenancyNameFinder.GetCurrentTenancyNameOrNull();
            }
            ViewBag.IsMultiTenancyEnabled = _multiTenancyConfig.IsEnabled;
            return View("Register", model);
        }

        [HttpPost]
        public virtual async Task<ActionResult> Register(RegisterViewModel model)
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
                    NickName = model.NickName,
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
                        throw new ApplicationException("Can not external login!");
                    }
                    user.Logins = new List<UserLogin>
                    {
                        new UserLogin
                        {
                            TenantId = tenant.Id,
                            LoginProvider = externalLoginInfo.Login.LoginProvider,
                            ProviderKey = externalLoginInfo.Login.ProviderKey
                        }
                    };

                    if (model.UserName.IsNullOrEmpty())
                    {
                        model.UserName = externalLoginInfo.ExternalIdentity.Claims.Where(c => c.Type == ClaimTypes.Name).FirstOrDefault().Value;
                    }
                    model.Password = Application.Authorization.Users.User.DefaultPassword;

                    if (string.Equals(externalLoginInfo.Email, model.EmailAddress, StringComparison.InvariantCultureIgnoreCase))
                    {
                        user.IsEmailConfirmed = true;
                    }
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

                if (!user.IsEmailConfirmed)
                {
                    try
                    {
                        user.SetNewEmailConfirmationCode();
                        await _userEmailer.SendEmailActivationLinkAsync(user);

                        //Notifications
                        await _notificationSubscriptionManager.SubscribeToAllAvailableNotificationsAsync(user.ToUserIdentifier());
                        await _appNotifier.WelcomeToTheApplicationAsync(user);
                        await _appNotifier.NewUserRegisteredAsync(user);

                    }
                    catch
                    {

                    }
                }

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

        public virtual async Task<ActionResult> ExternalLoginCallback(string returnUrl, string tenancyName = "")
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
                        return await RegisterView(loginInfo);
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

        protected virtual async Task<ActionResult> RegisterView(ExternalLoginInfo loginInfo, string tenancyName = null)
        {
            var name = loginInfo.DefaultUserName;
            var surname = loginInfo.DefaultUserName;

            var extractedNameAndSurname = TryExtractNameAndSurnameFromClaims(loginInfo.ExternalIdentity.Claims.ToList(), ref name, ref surname);

            var viewModel = new RegisterViewModel
            {
                TenancyName = tenancyName,
                EmailAddress = loginInfo.Email,
                Name = loginInfo.ExternalIdentity.Claims.Where(c => c.Type == ClaimTypes.Name).FirstOrDefault().Value,
                Surname = loginInfo.ExternalIdentity.Claims.Where(c => c.Type == ClaimTypes.NameIdentifier).FirstOrDefault().Value,
                NickName = loginInfo.ExternalIdentity.Claims.Where(c => c.Type == CommonClaimType.NickName).FirstOrDefault().Value,
                Avatar = loginInfo.ExternalIdentity.Claims.Where(model => model.Type == CommonClaimType.Avatar).FirstOrDefault().Value,
                IsExternalLogin = true
            };

            if (!tenancyName.IsNullOrEmpty() && extractedNameAndSurname)
            {
                return await Register(viewModel);
            }
            return RegisterView(viewModel);
        }

        public virtual ActionResult ExternalLogin(string provider, string returnUrl)
        {
            return new ChallengeResult(
                provider,
                Url.Action(
                    "ExternalLoginCallback",
                    "Account",
                    new
                    {
                        ReturnUrl = returnUrl
                    })
                );
        }

        #region Linked Account

        [UnitOfWork]
        [MvcAuthorize]
        public virtual async Task<JsonResult> SwitchToLinkedAccount(SwitchToLinkedAccountModel model)
        {
            if (!await _userLinkManager.AreUsersLinked(InfrastructureSession.ToUserIdentifier(), model.ToUserIdentifier()))
            {
                throw new ApplicationException(L("This account is not linked to your account"));
            }

            var result = await SaveAccountSwitchTokenAndGetTargetUrl(model.TargetTenantId, model.TargetUserId);
            AuthenticationManager.SignOutAll();
            return result;
        }

        [UnitOfWork]
        public virtual async Task<ActionResult> SwitchToLinkedAccountSignIn(string tokenId)
        {
            var cacheItem = await _cacheManager.GetSwitchToLinkedAccountCache().GetOrDefaultAsync(tokenId);

            if (cacheItem == null)
            {
                throw new UserFriendlyException(L("SwitchToLinkedAccountTokenErrorMessage"));
            }

            //Switch to requested tenant
            _unitOfWorkManager.Current.SetTenantId(cacheItem.TargetTenantId);

            //Get the user from tenant
            var user = await _userManager.FindByIdAsync(cacheItem.TargetUserId);

            //Create identity
            var identity = await _userManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);

            //Add claims for audit logging
            if (cacheItem.ImpersonatorTenantId.HasValue)
            {
                identity.AddClaim(new Claim(InfrastructureClaimTypes.ImpersonatorTenantId, cacheItem.ImpersonatorTenantId.Value.ToString(CultureInfo.InvariantCulture)));
            }

            if (cacheItem.ImpersonatorUserId.HasValue)
            {
                identity.AddClaim(new Claim(InfrastructureClaimTypes.ImpersonatorUserId, cacheItem.ImpersonatorUserId.Value.ToString(CultureInfo.InvariantCulture)));
            }
            AuthenticationManager.SignOutAllAndSignIn(identity);
            user.LastLoginTime = Clock.Now;

            //Remove the cache item to prevent re-use
            await _cacheManager.GetSwitchToLinkedAccountCache().RemoveAsync(tokenId);

            return RedirectToAction("Index", "Application");
        }

        private async Task<JsonResult> SaveAccountSwitchTokenAndGetTargetUrl(int? targetTenantId, long targetUserId)
        {
            //Create a cache item
            var cacheItem = new SwitchToLinkedAccountCacheItem(
                targetTenantId,
                targetUserId,
                InfrastructureSession.ImpersonatorTenantId,
                InfrastructureSession.ImpersonatorUserId
                );

            //Create a random token and save to the cache
            var tokenId = Guid.NewGuid().ToString();
            await _cacheManager
                .GetSwitchToLinkedAccountCache()
                .SetAsync(tokenId, cacheItem, TimeSpan.FromMinutes(1));

            //Find tenancy name
            string tenancyName = null;

            if (targetTenantId.HasValue)
            {
                tenancyName = (await _tenantManager.GetByIdAsync(targetTenantId.Value)).TenancyName;
            }

            //Create target URL
            var targetUrl = _webUrlService.GetSiteRootAddress(tenancyName) + "Account/SwitchToLinkedAccountSignIn?tokenId=" + tokenId;
            return Json(new AjaxResponse { TargetUrl = targetUrl });
        }

        #endregion

        protected virtual ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }

        private string NormalizeReturnUrl(string returnUrl, Func<string> defaultValueBuilder = null)
        {
            if (defaultValueBuilder == null)
            {
                defaultValueBuilder = () => Url.Action("Index", "Application");
            }

            if (returnUrl.IsNullOrEmpty())
            {
                return defaultValueBuilder();
            }

            if (Url.IsLocalUrl(returnUrl))
            {
                return returnUrl;
            }
            return defaultValueBuilder();
        }
    }
}