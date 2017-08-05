using Application.Configuration.Tenant.Dto;
using Application.Shops;
using Infrastructure.Configuration;
using System.Globalization;
using System.Threading.Tasks;

namespace Application.Configuration.Tenant
{
    public class TenantSettingsAppService : ApplicationAppServiceBase, ITenantSettingsAppService
    {
        readonly ISettingDefinitionManager _settingDefinitionManager;

        public TenantSettingsAppService(
         ISettingDefinitionManager settingDefinitionManager)
        {
            _settingDefinitionManager = settingDefinitionManager;
        }

        public async Task<TenantSettingsEditDto> GetAllSettings()
        {
            var settings = new TenantSettingsEditDto
            {
                Shop = new ShopSettingsEditDto
                {
                    Name = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.General.Name, InfrastructureSession.TenantId.Value),
                    Logo = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.General.Logo, InfrastructureSession.TenantId.Value),

                    ShareTitle = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.Share.ShareTitle, InfrastructureSession.TenantId.Value),
                    ShareDescription = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.Share.ShareDescription, InfrastructureSession.TenantId.Value),
                    SharePicture = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.Share.SharePicture, InfrastructureSession.TenantId.Value),

                    AutoReceiveLimit = await SettingManager.GetSettingValueForTenantAsync<int>(ShopSettings.Order.AutoReceiveLimit, InfrastructureSession.TenantId.Value),
                    RebateGuarantee = await SettingManager.GetSettingValueForTenantAsync<bool>(ShopSettings.Distribution.RebateGuarantee, InfrastructureSession.TenantId.Value),
                    AutoWithdraw = await SettingManager.GetSettingValueForTenantAsync<bool>(ShopSettings.Distribution.AutoWithdraw, InfrastructureSession.TenantId.Value),
                    AutoPayForWithdraw = await SettingManager.GetSettingValueForTenantAsync<bool>(ShopSettings.Distribution.AutoPayForWithdraw, InfrastructureSession.TenantId.Value),
                    DecreaseStockWhen = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.General.DecreaseStockWhen, InfrastructureSession.TenantId.Value),
                    OverTimeForDelete = await SettingManager.GetSettingValueForTenantAsync<int>(ShopSettings.Order.OverTimeForDelete, InfrastructureSession.TenantId.Value),
                    ShouldHasParentForBuy = await SettingManager.GetSettingValueForTenantAsync<bool>(ShopSettings.Order.ShouldHasParentForBuy, InfrastructureSession.TenantId.Value),
                    DistributionWhen = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.Distribution.DistributionWhen, InfrastructureSession.TenantId.Value),
                },
                Spread = new SpreadSettingsEditDto
                {
                    EnableSalesOfSelf = await SettingManager.GetSettingValueForTenantAsync<bool>(SpreadSettings.General.EnableSalesOfSelf, 
                    InfrastructureSession.TenantId.Value),
                    UpgradeOrderMoney = await SettingManager.GetSettingValueForTenantAsync<decimal>(SpreadSettings.General.UpgradeOrderMoney,
                    InfrastructureSession.TenantId.Value),
                    MustBeSpreaderForSpread = await SettingManager.GetSettingValueForTenantAsync<bool>(SpreadSettings.General.MustBeSpreaderForSpread,
                    InfrastructureSession.TenantId.Value),
                    MustBeAgencyToGetSpreadPoster = await SettingManager.GetSettingValueForTenantAsync<bool>(SpreadSettings.General.MustBeAgencyToGetSpreadPoster,
                    InfrastructureSession.TenantId.Value),
                }
            };
            return settings;
        }

        public async Task UpdateAllSettings(TenantSettingsEditDto input)
        {
            //General
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                ShopSettings.Distribution.DistributionWhen,
                input.Shop.DistributionWhen);

            await SettingManager.ChangeSettingForTenantAsync(
            InfrastructureSession.TenantId.Value,
            ShopSettings.Distribution.RebateGuarantee,
            input.Shop.RebateGuarantee.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));

            await SettingManager.ChangeSettingForTenantAsync(
            InfrastructureSession.TenantId.Value,
            ShopSettings.Distribution.AutoWithdraw,
            input.Shop.AutoWithdraw.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));

            await SettingManager.ChangeSettingForTenantAsync(
            InfrastructureSession.TenantId.Value,
            ShopSettings.Distribution.AutoPayForWithdraw,
            input.Shop.AutoPayForWithdraw.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));

            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                ShopSettings.General.DecreaseStockWhen,
                input.Shop.DecreaseStockWhen);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                ShopSettings.General.Name,
                input.Shop.Name);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                ShopSettings.General.Logo,
                input.Shop.Logo);

            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                ShopSettings.Share.ShareTitle,
                input.Shop.ShareTitle);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                ShopSettings.Share.ShareDescription,
                input.Shop.ShareDescription);
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                ShopSettings.Share.SharePicture,
                input.Shop.SharePicture);

            //Order
            await SettingManager.ChangeSettingForTenantAsync(
              InfrastructureSession.TenantId.Value,
              ShopSettings.Order.AutoReceiveLimit,
              input.Shop.AutoReceiveLimit.ToString());
            await SettingManager.ChangeSettingForTenantAsync(
               InfrastructureSession.TenantId.Value,
               ShopSettings.Order.OverTimeForDelete,
               input.Shop.OverTimeForDelete.ToString());
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                ShopSettings.Order.ShouldHasParentForBuy,
                input.Shop.ShouldHasParentForBuy.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));

            //Spread
            await SettingManager.ChangeSettingForTenantAsync(
               InfrastructureSession.TenantId.Value,
               SpreadSettings.General.EnableSalesOfSelf,
               input.Spread.EnableSalesOfSelf.ToString());
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                SpreadSettings.General.UpgradeOrderMoney,
                input.Spread.UpgradeOrderMoney.ToString());
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                SpreadSettings.General.MustBeSpreaderForSpread,
                input.Spread.MustBeSpreaderForSpread.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));
            await SettingManager.ChangeSettingForTenantAsync(
                InfrastructureSession.TenantId.Value,
                SpreadSettings.General.MustBeAgencyToGetSpreadPoster,
                input.Spread.MustBeAgencyToGetSpreadPoster.ToString(CultureInfo.InvariantCulture).ToLower(CultureInfo.InvariantCulture));
        }
    }
}
