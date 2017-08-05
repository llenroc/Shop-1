using Application.Configuration;
using Application.Wechats.PublicWechats.Dto;
using Infrastructure.Configuration;
using Infrastructure.Timing;
using System.Threading.Tasks;

namespace Application.Wechats.PublicWechats
{
    public class PublicWechatSettingsAppService : ApplicationAppServiceBase, IPublicWechatSettingsAppService
    {
        readonly ISettingDefinitionManager _settingDefinitionManager;

        public PublicWechatSettingsAppService(
         ISettingDefinitionManager settingDefinitionManager)
        {
            _settingDefinitionManager = settingDefinitionManager;
        }

        public async Task<SettingsEditDto> GetSettings()
        {
            var timezone = await SettingManager.GetSettingValueForApplicationAsync(TimingSettingNames.TimeZone);
            var settings = new SettingsEditDto
            {
                General = new GeneralSettingsDto
                {
                    Token = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Token, InfrastructureSession.TenantId.Value),
                    AppId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, InfrastructureSession.TenantId.Value),
                    Secret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, InfrastructureSession.TenantId.Value),
                    EncodingAESKey = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.EncodingAESKey, InfrastructureSession.TenantId.Value),
                    SubscribeLink = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.SubscribeLink, InfrastructureSession.TenantId.Value),
                },
                Pay = new PaySettingsEditDto
                {
                    MchId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.Pay.MchId, InfrastructureSession.TenantId.Value),
                    Key = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.Pay.Key, InfrastructureSession.TenantId.Value),
                    SslcertPath = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.Pay.SslcertPath, InfrastructureSession.TenantId.Value)
                },
                TemplateMessage = new TemplateMessageEditDto
                {
                    NewCustomer = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.NewCustomer, InfrastructureSession.TenantId.Value),
                    OrderCreated = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.OrderCreated, InfrastructureSession.TenantId.Value),
                    OrderPayed = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.OrderPayed, InfrastructureSession.TenantId.Value),
                    OrderShiped = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.OrderShiped, InfrastructureSession.TenantId.Value),
                    OrderRebate = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.OrderRebate, InfrastructureSession.TenantId.Value),
                    WalletWithdraw = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.WalletWithdraw, InfrastructureSession.TenantId.Value),
                    Upgrade = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.Upgrade, InfrastructureSession.TenantId.Value),
                }
            };
            return settings;
        }

        public async Task UpdateSettings(SettingsEditDto input)
        {
            //General
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                WechatSettings.General.Token,
                input.General.Token);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                WechatSettings.General.AppId,
                input.General.AppId);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                WechatSettings.General.Secret,
                input.General.Secret);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                WechatSettings.General.EncodingAESKey,
                input.General.EncodingAESKey);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                WechatSettings.General.SubscribeLink,
                input.General.SubscribeLink);

            await SettingManager.ChangeSettingForTenantAsync(
               InfrastructureSession.TenantId.Value,
               WechatSettings.Pay.MchId,
               input.Pay.MchId);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                WechatSettings.Pay.Key,
                input.Pay.Key);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                WechatSettings.Pay.SslcertPath,
                input.Pay.SslcertPath);

            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                WechatSettings.TemplateMessage.NewCustomer,
                input.TemplateMessage.NewCustomer);
            await SettingManager.ChangeSettingForTenantAsync(
               InfrastructureSession.TenantId.Value,
               WechatSettings.TemplateMessage.OrderCreated,
               input.TemplateMessage.OrderCreated);
            await SettingManager.ChangeSettingForTenantAsync(
              InfrastructureSession.TenantId.Value,
              WechatSettings.TemplateMessage.OrderPayed,
              input.TemplateMessage.OrderPayed);
            await SettingManager.ChangeSettingForTenantAsync(
              InfrastructureSession.TenantId.Value,
              WechatSettings.TemplateMessage.OrderShiped,
              input.TemplateMessage.OrderShiped);
            await SettingManager.ChangeSettingForTenantAsync(
              InfrastructureSession.TenantId.Value,
              WechatSettings.TemplateMessage.OrderRebate,
              input.TemplateMessage.OrderRebate);
            await SettingManager.ChangeSettingForTenantAsync(
              InfrastructureSession.TenantId.Value,
              WechatSettings.TemplateMessage.WalletWithdraw,
              input.TemplateMessage.WalletWithdraw);
            await SettingManager.ChangeSettingForTenantAsync(
             InfrastructureSession.TenantId.Value,
             WechatSettings.TemplateMessage.Upgrade,
             input.TemplateMessage.Upgrade);
        }
    }
}
