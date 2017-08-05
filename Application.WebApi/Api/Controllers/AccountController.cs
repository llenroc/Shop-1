using System;
using System.Threading.Tasks;
using System.Web.Http;
using Infrastructure.Authorization.Users;
using Infrastructure.UI;
using Infrastructure.Web.Models;
using Infrastructure.WebApi.Controllers;
using Application.Api.Models;
using Application.Authorization;
using Application.MultiTenancy;
using Application.Authorization.Users;
using Microsoft.Owin.Infrastructure;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;

namespace Application.Api.Controllers
{
    public class AccountController : InfrastructureApiController
    {
        public static OAuthBearerAuthenticationOptions OAuthBearerOptions { get; private set; }

        private readonly LogInManager _logInManager;
        private readonly LoginResultTypeHelper _loginResultTypeHelper;

        static AccountController()
        {
            OAuthBearerOptions = new OAuthBearerAuthenticationOptions();
        }

        public AccountController(LogInManager logInManager, LoginResultTypeHelper loginResultTypeHelper)
        {
            _logInManager = logInManager;
            _loginResultTypeHelper = loginResultTypeHelper;
            LocalizationSourceName = ApplicationConsts.LocalizationSourceName;
        }

        [HttpPost]
        public async Task<AjaxResponse> Authenticate(LoginModel loginModel)
        {
            CheckModelState();

            var loginResult = await GetLoginResultAsync(
                loginModel.UsernameOrEmailAddress,
                loginModel.Password,
                loginModel.TenancyName
                );

            var ticket = new AuthenticationTicket(loginResult.Identity, new AuthenticationProperties());

            var currentUtc = new SystemClock().UtcNow;
            ticket.Properties.IssuedUtc = currentUtc;
            ticket.Properties.ExpiresUtc = currentUtc.Add(TimeSpan.FromMinutes(30));

            return new AjaxResponse(OAuthBearerOptions.AccessTokenFormat.Protect(ticket));
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

        protected virtual void CheckModelState()
        {
            if (!ModelState.IsValid)
            {
                throw new UserFriendlyException("Invalid request!");
            }
        }
    }
}
