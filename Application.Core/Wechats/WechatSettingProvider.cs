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
    public class WechatSettingProvider : SettingProvider
    {
        public override IEnumerable<SettingDefinition> GetSettingDefinitions(SettingDefinitionProviderContext context)
        {
            return new[]
            {
                new SettingDefinition(WechatSettings.General.Token,ConfigurationManager.AppSettings[WechatSettings.General.Token] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.General.AppId,ConfigurationManager.AppSettings[WechatSettings.General.AppId] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.General.Secret,ConfigurationManager.AppSettings[WechatSettings.General.Secret] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.General.EncodingAESKey,ConfigurationManager.AppSettings[WechatSettings.General.EncodingAESKey] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.General.SubscribeLink,ConfigurationManager.AppSettings[WechatSettings.General.SubscribeLink] ?? "",scopes: SettingScopes.Tenant),

                new SettingDefinition(WechatSettings.Pay.MchId,ConfigurationManager.AppSettings[WechatSettings.Pay.MchId] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.Pay.Key,ConfigurationManager.AppSettings[WechatSettings.Pay.Key] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.Pay.SslcertPath,ConfigurationManager.AppSettings[WechatSettings.Pay.SslcertPath] ?? "",scopes: SettingScopes.Tenant),

                new SettingDefinition(WechatSettings.TemplateMessage.NewCustomer,ConfigurationManager.AppSettings[WechatSettings.TemplateMessage.NewCustomer] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.TemplateMessage.OrderCreated,ConfigurationManager.AppSettings[WechatSettings.TemplateMessage.OrderCreated] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.TemplateMessage.OrderPayed,ConfigurationManager.AppSettings[WechatSettings.TemplateMessage.OrderPayed] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.TemplateMessage.OrderShiped,ConfigurationManager.AppSettings[WechatSettings.TemplateMessage.OrderShiped] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.TemplateMessage.OrderRebate,ConfigurationManager.AppSettings[WechatSettings.TemplateMessage.OrderRebate] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.TemplateMessage.WalletWithdraw,ConfigurationManager.AppSettings[WechatSettings.TemplateMessage.WalletWithdraw] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(WechatSettings.TemplateMessage.Upgrade,ConfigurationManager.AppSettings[WechatSettings.TemplateMessage.Upgrade] ?? "",scopes: SettingScopes.Tenant)
            };

        }
    }
}
