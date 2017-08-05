using System;
using Microsoft.Owin.Security.Weixin;
using Infrastructure.Configuration;
using Application.Configuration;
using Infrastructure.Dependency;

namespace Owin
{
    /// <summary>
    /// Extension methods for using <see cref="WeixinAuthenticationMiddleware"/>
    /// </summary>
    public static class WeixinAuthenticationExtensions
    {
        /// <summary>
        /// Authenticate users using Weixin
        /// </summary>
        public static IAppBuilder UseWeixinAuthentication(this IAppBuilder app, WeixinAuthenticationOptions options)
        {
            if (app == null)
            {
                throw new ArgumentNullException("app");
            }

            if (options == null)
            {
                throw new ArgumentNullException("options");
            }
            app.Use(typeof(WeixinAuthenticationMiddleware), app, options);
            return app;
        }

        public static IAppBuilder UseWeixinAuthentication(this IAppBuilder app)
        {
            ISettingManager _settingManager = IocManager.Instance.Resolve<ISettingManager>();
            string appId = _settingManager.GetSettingValue(WechatSettings.General.AppId);
            string appSecret= _settingManager.GetSettingValue(WechatSettings.General.Secret);
            return UseWeixinAuthentication(app, new WeixinAuthenticationOptions() { AppId = appId, AppSecret = appSecret });
        }

        /// <summary>
        /// Authenticate users using Weixin
        /// </summary>
        public static IAppBuilder UseWeixinAuthentication(this IAppBuilder app, string appId, string appSecret)
        {
            return UseWeixinAuthentication(app, new WeixinAuthenticationOptions() { AppId = appId, AppSecret = appSecret });
        }
    }
}