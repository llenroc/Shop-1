using Application.Configuration.Host.Dto;
using Application.Sessions.Dto;
using Infrastructure.Application.Navigation;
using Infrastructure.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Application.WebSite.Models.Layout
{
    public class HeaderViewModel
    {
        public AppSettingsOutput AppSettings { get; set; }

        public CurrentLoginInformationsOutput LoginInformations { get; set; }

        public IReadOnlyList<LanguageInfo> Languages { get; set; }

        public LanguageInfo CurrentLanguage { get; set; }

        public UserMenu Menu { get; set; }

        public string CurrentPageName { get; set; }

        public bool IsMultiTenancyEnabled { get; set; }

        public bool TenantRegistrationEnabled { get; set; }

        public string GetShownLoginName()
        {
            if (!IsMultiTenancyEnabled)
            {
                return LoginInformations.User.UserName;
            }

            return LoginInformations.Tenant == null
                ? ".\\" + LoginInformations.User.UserName
                : LoginInformations.Tenant.TenancyName + "\\" + LoginInformations.User.UserName;
        }
    }
}