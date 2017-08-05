using Application.Shops;
using Infrastructure.Configuration;
using System.Collections.Generic;
using System.Configuration;

namespace Application.Configuration
{
    public class ShopSettingProvider : SettingProvider
    {
        public override IEnumerable<SettingDefinition> GetSettingDefinitions(SettingDefinitionProviderContext context)
        {
            return new[]
            {
                new SettingDefinition(ShopSettings.General.Name,ConfigurationManager.AppSettings[ShopSettings.General.Name] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.General.Logo,ConfigurationManager.AppSettings[ShopSettings.General.Logo] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.General.DecreaseStockWhen,ConfigurationManager.AppSettings[ShopSettings.General.DecreaseStockWhen] ?? "",scopes: SettingScopes.Tenant),

                new SettingDefinition(ShopSettings.Share.ShareTitle,ConfigurationManager.AppSettings[ShopSettings.Share.ShareTitle] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.Share.ShareDescription,ConfigurationManager.AppSettings[ShopSettings.Share.ShareDescription] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.Share.SharePicture,ConfigurationManager.AppSettings[ShopSettings.Share.SharePicture] ?? "",scopes: SettingScopes.Tenant),

                new SettingDefinition(ShopSettings.Order.AutoReceiveLimit,ConfigurationManager.AppSettings[ShopSettings.Order.AutoReceiveLimit] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.Distribution.RebateGuarantee,ConfigurationManager.AppSettings[ShopSettings.Distribution.RebateGuarantee] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.Distribution.AutoWithdraw,ConfigurationManager.AppSettings[ShopSettings.Distribution.AutoWithdraw] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.Distribution.AutoPayForWithdraw,ConfigurationManager.AppSettings[ShopSettings.Distribution.AutoPayForWithdraw] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.Order.ShouldHasParentForBuy,ConfigurationManager.AppSettings[ShopSettings.Order.ShouldHasParentForBuy] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.Order.OverTimeForDelete,ConfigurationManager.AppSettings[ShopSettings.Order.OverTimeForDelete] ?? "",scopes: SettingScopes.Tenant),
                new SettingDefinition(ShopSettings.Distribution.DistributionWhen,ConfigurationManager.AppSettings[ShopSettings.Distribution.DistributionWhen] ?? "",scopes: SettingScopes.Tenant),
            };
        }
    }
}
