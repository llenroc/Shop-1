using Application.Configuration;
using Castle.Core.Internal;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Extensions;

namespace Application.Web
{
    public class WebUrlService : IWebUrlService, ITransientDependency
    {
        public const string TenancyNamePlaceHolder = "{TENANCY_NAME}";

        private readonly ISettingManager _settingManager;

        public WebUrlService(ISettingManager settingManager)
        {
            _settingManager = settingManager;
        }

        public string GetSiteRootAddress(string tenancyName = null)
        {
            var siteRootFormat = _settingManager.GetSettingValue(AppSettings.General.WebSiteRootAddress).EnsureEndsWith('/');

            if (!siteRootFormat.Contains(TenancyNamePlaceHolder))
            {
                return siteRootFormat;
            }

            if (siteRootFormat.Contains(TenancyNamePlaceHolder + "."))
            {
                siteRootFormat = siteRootFormat.Replace(TenancyNamePlaceHolder + ".", TenancyNamePlaceHolder);
            }

            if (tenancyName.IsNullOrEmpty())
            {
                return siteRootFormat.Replace(TenancyNamePlaceHolder, "");
            }
            return siteRootFormat.Replace(TenancyNamePlaceHolder, tenancyName + ".");
        }
    }
}
