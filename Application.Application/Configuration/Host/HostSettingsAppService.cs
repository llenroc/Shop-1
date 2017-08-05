using Application.Configuration.Host.Dto;
using Application.Editions;
using Infrastructure.CommonFrame.Configuration;
using Infrastructure.Configuration;
using Infrastructure.Extensions;
using Infrastructure.Net.Mail;
using Infrastructure.Timing;
using System.Globalization;
using System.Threading.Tasks;

namespace Application.Configuration.Host
{
    public class HostSettingsAppService:ApplicationAppServiceBase,IHostSettingsAppService
    {
        private readonly IEmailSender _emailSender;
        private readonly EditionManager _editionManager;
        readonly ISettingDefinitionManager _settingDefinitionManager;

        public HostSettingsAppService(
         IEmailSender emailSender,
         EditionManager editionManager,
         ISettingDefinitionManager settingDefinitionManager)
        {
            _emailSender = emailSender;
            _editionManager = editionManager;
            _settingDefinitionManager = settingDefinitionManager;
        }

        public AppSettingsOutput GetAppSettings()
        {
            var appSettingsOutput = new AppSettingsOutput()
            {
                AppName = SettingManager.GetSettingValue(AppSettings.General.AppName),
                AppLogo =SettingManager.GetSettingValue(AppSettings.General.AppLogo),
                AppTitleLogo = SettingManager.GetSettingValue(AppSettings.General.AppTitleLogo),
            };
            return appSettingsOutput;
        }

        public async Task<HostSettingsEditDto> GetAllSettings()
        {
            var timezone = await SettingManager.GetSettingValueForApplicationAsync(TimingSettingNames.TimeZone);
            var hostSettings = new HostSettingsEditDto
            {
                General = new GeneralSettingsEditDto
                {
                    WebSiteRootAddress = await SettingManager.GetSettingValueAsync(AppSettings.General.WebSiteRootAddress),
                    WebSiteStatus = await SettingManager.GetSettingValueAsync<bool>(AppSettings.General.WebSiteStatus),
                    AppName = await SettingManager.GetSettingValueAsync(AppSettings.General.AppName),
                    AppLogo = await SettingManager.GetSettingValueAsync(AppSettings.General.AppLogo),
                    AppTitleLogo = await SettingManager.GetSettingValueAsync(AppSettings.General.AppTitleLogo),
                    Timezone = timezone,
                    TimezoneForComparison = timezone
                },
                UserManagement = new HostUserManagementSettingsEditDto
                {
                    IsEmailConfirmationRequiredForLogin = await SettingManager.GetSettingValueAsync<bool>(CommonFrameSettingNames.UserManagement.IsEmailConfirmationRequiredForLogin)
                },
                Email = new EmailSettingsEditDto
                {
                    DefaultFromAddress = await SettingManager.GetSettingValueAsync(EmailSettingNames.DefaultFromAddress),
                    DefaultFromDisplayName = await SettingManager.GetSettingValueAsync(EmailSettingNames.DefaultFromDisplayName),
                    SmtpHost = await SettingManager.GetSettingValueAsync(EmailSettingNames.Smtp.Host),
                    SmtpPort = await SettingManager.GetSettingValueAsync<int>(EmailSettingNames.Smtp.Port),
                    SmtpUserName = await SettingManager.GetSettingValueAsync(EmailSettingNames.Smtp.UserName),
                    SmtpPassword = await SettingManager.GetSettingValueAsync(EmailSettingNames.Smtp.Password),
                    SmtpDomain = await SettingManager.GetSettingValueAsync(EmailSettingNames.Smtp.Domain),
                    SmtpEnableSsl = await SettingManager.GetSettingValueAsync<bool>(EmailSettingNames.Smtp.EnableSsl),
                    SmtpUseDefaultCredentials = await SettingManager.GetSettingValueAsync<bool>(EmailSettingNames.Smtp.UseDefaultCredentials)
                }
            };
            var defaultTenantId = await SettingManager.GetSettingValueAsync(AppSettings.TenantManagement.DefaultEdition);
            var passwordComplexitySetting = await SettingManager.GetSettingValueAsync(AppSettings.Security.PasswordComplexity);
            var defaultPasswordComplexitySetting = _settingDefinitionManager.GetSettingDefinition(AppSettings.Security.PasswordComplexity).DefaultValue;
            return hostSettings;
        }

        public async Task UpdateAllSettings(HostSettingsEditDto input)
        {
            //General
            await SettingManager.ChangeSettingForApplicationAsync(
                AppSettings.General.WebSiteRootAddress, 
                input.General.WebSiteRootAddress.EnsureEndsWith('/'));
            await SettingManager.ChangeSettingForApplicationAsync(
                AppSettings.General.WebSiteStatus,
                input.General.WebSiteStatus.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));
            await SettingManager.ChangeSettingForApplicationAsync(
                AppSettings.General.AppName,
                input.General.AppName);
            await SettingManager.ChangeSettingForApplicationAsync(
                AppSettings.General.AppLogo,
                input.General.AppLogo);
            await SettingManager.ChangeSettingForApplicationAsync(
              AppSettings.General.AppTitleLogo,
              input.General.AppTitleLogo);

            //User management
            await SettingManager.ChangeSettingForApplicationAsync(CommonFrameSettingNames.UserManagement.IsEmailConfirmationRequiredForLogin, 
                input.UserManagement.IsEmailConfirmationRequiredForLogin.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));

            //Email
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.DefaultFromAddress, input.Email.DefaultFromAddress);
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.DefaultFromDisplayName, input.Email.DefaultFromDisplayName);
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.Smtp.Host, input.Email.SmtpHost);
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.Smtp.Port, input.Email.SmtpPort.ToString(CultureInfo.InvariantCulture));
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.Smtp.UserName, input.Email.SmtpUserName);
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.Smtp.Password, input.Email.SmtpPassword);
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.Smtp.Domain, input.Email.SmtpDomain);
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.Smtp.EnableSsl, input.Email.SmtpEnableSsl.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));
            await SettingManager.ChangeSettingForApplicationAsync(EmailSettingNames.Smtp.UseDefaultCredentials, input.Email.SmtpUseDefaultCredentials.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));
        }

        public async Task SendTestEmail(SendTestEmailInput input)
        {
            var subject = L("TestEmailSubject");
            var body = L("TestEmailBody");
            await _emailSender.SendAsync(input.EmailAddress, subject, body);
        }
    }
}
