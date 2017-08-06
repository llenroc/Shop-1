using Application.Api.Controllers;
using Hangfire;
using Infrastructure.Hangfire;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Owin;
using System;
using System.Configuration;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Application.WebSite
{
    public partial class Startup
    {
        // 有关配置身份验证的详细信息，请访问 http://go.microsoft.com/fwlink/?LinkId=301864
        public void ConfigureAuth(IAppBuilder app)
        {
            app.UseOAuthBearerAuthentication(AccountController.OAuthBearerOptions);
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login"),
                //Set the Provider
                Provider = getProvide()
            });
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // 使应用程序可以在双重身份验证过程中验证第二因素时暂时存储用户信息。
            //app.UseTwoFactorSignInCookie(DefaultAuthenticationTypes.TwoFactorCookie, TimeSpan.FromMinutes(5));

            // 使应用程序可以记住第二登录验证因素，例如电话或电子邮件。
            // 选中此选项后，登录过程中执行的第二个验证步骤将保存到你登录时所在的设备上。
            // 此选项类似于在登录时提供的“记住我”选项。
            //app.UseTwoFactorRememberBrowserCookie(DefaultAuthenticationTypes.TwoFactorRememberBrowserCookie);

            //app.UseWeixinAuthentication();
            app.UseWeixinAuthentication("wx58409f28514e21b5", "79341b369eb69e4c68ff5ef8d128927a");

            app.UseHangfireDashboard("/hangfire", new DashboardOptions
            {
                Authorization = new[] { new HangfireAuthorizationFilter() }
            });
        }

        private static CookieAuthenticationProvider getProvide()
        {
            CookieAuthenticationProvider provider = new CookieAuthenticationProvider()
            {
            };
            var originalHandler = provider.OnApplyRedirect;

            //Our logic to dynamically modify the path (maybe needs some fine tuning)
            provider.OnApplyRedirect = context =>
            {
                UrlHelper urlHelper = new UrlHelper(HttpContext.Current.Request.RequestContext);
                var mvcContext = new HttpContextWrapper(HttpContext.Current);
                RouteData routeData = RouteTable.Routes.GetRouteData(mvcContext);
                RouteValueDictionary routeValues = new RouteValueDictionary();

                if (!(routeData.Values["controller"].ToString() == "Account" && routeData.Values["action"].ToString() == "Login"))
                {
                    //Get the current language  
                    routeValues.Add("lang", routeData.Values["lang"]);

                    //Reuse the RetrunUrl
                    Uri uri = new Uri(context.RedirectUri);
                    string returnUrl = HttpUtility.ParseQueryString(uri.Query)[context.Options.ReturnUrlParameter];
                    routeValues.Add(context.Options.ReturnUrlParameter, returnUrl);

                    if (routeData.DataTokens["area"] != null && routeData.DataTokens["area"].ToString() != null)
                    {
                        string areaName = routeData.DataTokens["area"].ToString();

                        if (areaName == "Mobile")
                        {
                            string userAgent = HttpContext.Current.Request.UserAgent;

                            if (true||userAgent.ToLower().Contains("micromessenger"))
                            {
                                routeValues.Add("provider", "Weixin");
                                context.RedirectUri = urlHelper.Action("ExternalLogin", "Account", routeValues);
                                originalHandler.Invoke(context);
                                return;
                            }
                        }
                        routeValues.Add("area", areaName);
                    }

                    //Overwrite the redirection uri
                    context.RedirectUri = urlHelper.Action("Login", "Account", routeValues);
                }
                originalHandler.Invoke(context);
            };
            return provider;
        }

        private static bool IsTrue(string appSettingName)
        {
            return string.Equals(ConfigurationManager.AppSettings[appSettingName], "true", StringComparison.InvariantCultureIgnoreCase);
        }
    }
}