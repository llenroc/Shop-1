using Application.Scores;
using Application.Sessions.Dto;
using Application.Shops;
using Infrastructure.Auditing;
using Infrastructure.AutoMapper;
using System.Threading.Tasks;
using Infrastructure.Runtime.Session;
using Application.Scores.Front.Dto;
using Application.Authorization;

namespace Application.Sessions
{
    public class SessionAppService : ApplicationAppServiceBase, ISessionAppService
    {
        public ScoreManager ScoreManager { get; set; }
        public AuthorizationHelper AuthorizationHelper { get; set; }

        [DisableAuditing]
        public CurrentLoginInformationsOutput GetCurrentLoginInformations()
        {
            var output = new CurrentLoginInformationsOutput
            {
                User = AuthorizationHelper.CurrentUser.MapTo<UserLoginInfoDto>()
            };

            if (InfrastructureSession.TenantId.HasValue)
            {
                output.User.Score = ScoreManager.GetScore(InfrastructureSession.ToUserIdentifier()).MapTo<ScoreDto>();
            }
           
            if (InfrastructureSession.TenantId.HasValue)
            {
                output.Tenant = GetCurrentTenant().MapTo<TenantLoginInfoDto>();
            }
            return output;
        }

        public async Task<ShopInformationsOutput> GetShopInformations()
        {
            var output = new ShopInformationsOutput
            {
                Name= await SettingManager.GetSettingValueForTenantAsync(ShopSettings.General.Name, InfrastructureSession.TenantId.Value),
                Logo = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.General.Logo, InfrastructureSession.TenantId.Value),

                ShareTitle = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.Share.ShareTitle, InfrastructureSession.TenantId.Value),
                ShareDescription = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.Share.ShareDescription, InfrastructureSession.TenantId.Value),
                SharePicture = await SettingManager.GetSettingValueForTenantAsync(ShopSettings.Share.SharePicture, InfrastructureSession.TenantId.Value),
            };
            return output;
        }
    }
}