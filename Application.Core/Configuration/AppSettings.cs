namespace Application.Configuration
{
    /// <summary>
    /// Defines string constants for setting names in the Application.
    /// See <see cref="AppSettingProvider"/> for setting definitions.
    /// </summary>
    public static class AppSettings
    {
        public static class General
        {
            public const string WebSiteRootAddress = "App.General.WebSiteRootAddress";
            public const string WebSiteStatus = "App.General.WebSiteStatus";
            public const string AppName = "App.General.Name";
            public const string AppLogo = "App.General.Logo";
            public const string AppTitleLogo = "App.General.TitleLogo";
        }

        public static class TenantManagement
        {
            public const string AllowSelfRegistration = "App.TenantManagement.AllowSelfRegistration";
            public const string IsNewRegisteredTenantActiveByDefault = "App.TenantManagement.IsNewRegisteredTenantActiveByDefault";
            public const string UseCaptchaOnRegistration = "App.TenantManagement.UseCaptchaOnRegistration";
            public const string DefaultEdition = "App.TenantManagement.DefaultEdition";
        }

        public static class UserManagement
        {
            public const string AllowSelfRegistration = "App.UserManagement.AllowSelfRegistration";
            public const string IsNewRegisteredUserActiveByDefault = "App.UserManagement.IsNewRegisteredUserActiveByDefault";
            public const string UseCaptchaOnRegistration = "App.UserManagement.UseCaptchaOnRegistration";
        }

        public static class Security
        {
            public const string PasswordComplexity = "App.Security.PasswordComplexity";
        }
    }
}