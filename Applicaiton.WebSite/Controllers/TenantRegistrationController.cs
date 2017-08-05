using System;
using System.Net;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Infrastructure.Authorization.Users;
using Infrastructure.Configuration;
using Infrastructure.Configuration.Startup;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.UI;
using Infrastructure.CommonFrame.Configuration;
using Application.Configuration;
using Application.Web.Models.TenantRegistration;
using Recaptcha.Web;
using Recaptcha.Web.Mvc;
using Infrastructure.Extensions;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Application.Authorization;
using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.Editions;
using Application.MultiTenancy;
using Application.Notifications;
using Newtonsoft.Json;
using Application.Security;

namespace Application.WebSite.Controllers
{
    public class TenantRegistrationController : AnonymousHomeControllerBase
    {
        private readonly IMultiTenancyConfig _multiTenancyConfig;
        private readonly TenantManager _tenantManager;
        private readonly UserManager _userManager;
        private readonly LogInManager _logInManager;
        private readonly EditionManager _editionManager;
        private readonly IAppNotifier _appNotifier;
        private readonly LoginResultTypeHelper _loginResultTypeHelper;

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        public TenantRegistrationController(
            IMultiTenancyConfig multiTenancyConfig,
            TenantManager tenantManager,
            EditionManager editionManager,
            IAppNotifier appNotifier,
            UserManager userManager,
            LogInManager logInManager,
            LoginResultTypeHelper loginResultTypeHelper)
        {
            _multiTenancyConfig = multiTenancyConfig;
            _tenantManager = tenantManager;
            _editionManager = editionManager;
            _appNotifier = appNotifier;
            _userManager = userManager;
            _logInManager = logInManager;
            _loginResultTypeHelper = loginResultTypeHelper;
        }

        // GET: TenantRegistration
        public ActionResult Index()
        {
            CheckTenantRegistrationIsEnabled();

            ViewBag.UseCaptcha = UseCaptchaOnRegistration();
            ViewBag.PasswordComplexitySetting = SettingManager.GetSettingValue(AppSettings.Security.PasswordComplexity).Replace("\"", "");

            return View();
        }

        [HttpPost]
        public virtual async Task<ActionResult> Register(TenantRegistrationViewModel model)
        {
            try
            {
                CheckTenantRegistrationIsEnabled();

                if (UseCaptchaOnRegistration())
                {
                    var recaptchaHelper = this.GetRecaptchaVerificationHelper();

                    if (recaptchaHelper.Response.IsNullOrEmpty())
                    {
                        throw new UserFriendlyException(L("CaptchaCanNotBeEmpty"));
                    }

                    if (recaptchaHelper.VerifyRecaptchaResponse() != RecaptchaVerificationResult.Success)
                    {
                        throw new UserFriendlyException(L("IncorrectCaptchaAnswer"));
                    }
                }

                //Getting host-specific settings
                var isNewRegisteredTenantActiveByDefault = await SettingManager.GetSettingValueForApplicationAsync<bool>(AppSettings.TenantManagement.IsNewRegisteredTenantActiveByDefault);
                var isEmailConfirmationRequiredForLogin = await SettingManager.GetSettingValueForApplicationAsync<bool>(CommonFrameSettingNames.UserManagement.IsEmailConfirmationRequiredForLogin);
                var defaultEditionIdValue = await SettingManager.GetSettingValueForApplicationAsync(AppSettings.TenantManagement.DefaultEdition);
                int? defaultEditionId = null;

                if (!string.IsNullOrEmpty(defaultEditionIdValue) && (await _editionManager.FindByIdAsync(Convert.ToInt32(defaultEditionIdValue)) != null))
                {
                    defaultEditionId = Convert.ToInt32(defaultEditionIdValue);
                }
                CurrentUnitOfWork.SetTenantId(null);

                var tenantId = await _tenantManager.CreateWithAdminUserAsync(
                  model.TenancyName,
                  model.Name,
                  model.AdminPassword,
                  model.AdminEmailAddress,
                  null,
                  isNewRegisteredTenantActiveByDefault,
                  defaultEditionId,
                  false,
                  isEmailConfirmationRequiredForLogin);

                ViewBag.UseCaptcha = UseCaptchaOnRegistration();

                var tenant = await _tenantManager.GetByIdAsync(tenantId);
                await _appNotifier.NewTenantRegisteredAsync(tenant);

                CurrentUnitOfWork.SetTenantId(tenant.Id);

                var user = await _userManager.FindByNameAsync(Application.Authorization.Users.User.AdminUserName);

                //Directly login if possible
                if (user.IsActive && (user.IsEmailConfirmed || !isEmailConfirmationRequiredForLogin))
                {
                    var loginResult = await GetLoginResultAsync(user.UserName, model.AdminPassword, tenant.TenancyName);

                    if (loginResult.Result == LoginResultType.Success)
                    {
                        await SignInAsync(loginResult.User, loginResult.Identity);
                        return Redirect(Url.Action("Index", "Application"));
                    }
                    Logger.Warn("New registered user could not be login. This should not be normally. login result: " + loginResult.Result);
                }

                return View("RegisterResult", new TenantRegisterResultViewModel
                {
                    TenancyName = model.TenancyName,
                    Name = model.Name,
                    UserName = Application.Authorization.Users.User.AdminUserName,
                    EmailAddress = model.AdminEmailAddress,
                    IsActive = isNewRegisteredTenantActiveByDefault,
                    IsEmailConfirmationRequired = isEmailConfirmationRequiredForLogin
                });
            }
            catch (UserFriendlyException ex)
            {
                ViewBag.UseCaptcha = UseCaptchaOnRegistration();
                ViewBag.ErrorMessage = ex.Message;

                return View("Index", model);
            }
        }

        private async Task<LoginResult<Tenant, User>> GetLoginResultAsync(string usernameOrEmailAddress, string password, string tenancyName)
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

        private async Task SignInAsync(User user, ClaimsIdentity identity = null, bool rememberMe = false)
        {
            if (identity == null)
            {
                identity = await _userManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);
            }
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignIn(new AuthenticationProperties { IsPersistent = rememberMe }, identity);
        }

        private bool IsSelfRegistrationEnabled()
        {
            return SettingManager.GetSettingValueForApplication<bool>(AppSettings.TenantManagement.AllowSelfRegistration);
        }

        private void CheckTenantRegistrationIsEnabled()
        {
            if (!IsSelfRegistrationEnabled())
            {
                throw new UserFriendlyException(L("SelfTenantRegistrationIsDisabledMessage_Detail"));
            }

            if (!_multiTenancyConfig.IsEnabled)
            {
                throw new UserFriendlyException(L("MultiTenancyIsNotEnabled"));
            }
        }

        private bool UseCaptchaOnRegistration()
        {
            return false;
            return SettingManager.GetSettingValueForApplication<bool>(AppSettings.TenantManagement.UseCaptchaOnRegistration);
        }
    }
}