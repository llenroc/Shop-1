using System.Collections.Generic;
using System.Configuration;
using Infrastructure.Configuration;
using Infrastructure.Json;
using Application.Security;

namespace Application.Configuration
{
    /// <summary>
    /// Defines settings for the application.
    /// See <see cref="AppSettings"/> for setting names.
    /// </summary>
    public class AppSettingProvider : SettingProvider
    {
        public override IEnumerable<SettingDefinition> GetSettingDefinitions(SettingDefinitionProviderContext context)
        {
            var defaultPasswordComplexitySetting = new PasswordComplexitySetting
            {
                MinLength = 6,
                MaxLength = 10,
                UseNumbers = true,
                UseUpperCaseLetters = false,
                UseLowerCaseLetters = true,
                UsePunctuations = false,
            };

            return new[]
            {
                //Host settings
                new SettingDefinition(AppSettings.General.WebSiteRootAddress, "http://{TENANCY_NAME}.localhost/"),
                new SettingDefinition(AppSettings.General.WebSiteStatus, "true"),
                new SettingDefinition(AppSettings.General.AppName, ConfigurationManager.AppSettings[AppSettings.General.AppName] ?? "Canknow"),
                new SettingDefinition(AppSettings.General.AppLogo, ConfigurationManager.AppSettings[AppSettings.General.AppLogo] ?? ""),
                new SettingDefinition(AppSettings.General.AppTitleLogo, ConfigurationManager.AppSettings[AppSettings.General.AppTitleLogo] ?? ""),

                new SettingDefinition(AppSettings.TenantManagement.AllowSelfRegistration,ConfigurationManager.AppSettings[AppSettings.TenantManagement.UseCaptchaOnRegistration] ?? "true"),
                new SettingDefinition(AppSettings.TenantManagement.IsNewRegisteredTenantActiveByDefault,ConfigurationManager.AppSettings[AppSettings.TenantManagement.IsNewRegisteredTenantActiveByDefault] ??"false"),
                new SettingDefinition(AppSettings.TenantManagement.UseCaptchaOnRegistration,ConfigurationManager.AppSettings[AppSettings.TenantManagement.UseCaptchaOnRegistration] ?? "true"),
                new SettingDefinition(AppSettings.TenantManagement.DefaultEdition,ConfigurationManager.AppSettings[AppSettings.TenantManagement.DefaultEdition] ?? ""),

                new SettingDefinition(AppSettings.Security.PasswordComplexity, defaultPasswordComplexitySetting.ToJsonString(),scopes: SettingScopes.Application | SettingScopes.Tenant),

                //Tenant settings
                new SettingDefinition(AppSettings.UserManagement.AllowSelfRegistration, ConfigurationManager.AppSettings[AppSettings.UserManagement.UseCaptchaOnRegistration] ?? "true", scopes: SettingScopes.Tenant),
                new SettingDefinition(AppSettings.UserManagement.IsNewRegisteredUserActiveByDefault, ConfigurationManager.AppSettings[AppSettings.UserManagement.IsNewRegisteredUserActiveByDefault] ?? "false", scopes: SettingScopes.Tenant),
                new SettingDefinition(AppSettings.UserManagement.UseCaptchaOnRegistration, ConfigurationManager.AppSettings[AppSettings.UserManagement.UseCaptchaOnRegistration] ?? "true", scopes: SettingScopes.Tenant)
            };
        }
    }
}
