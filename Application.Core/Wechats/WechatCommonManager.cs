using Application.Configuration;
using Senparc.Weixin.MP.Containers;
using Senparc.Weixin.MP.TenPayLibV3;
using System.Threading.Tasks;

namespace Application.Wechats
{
    public class WechatCommonManager : ApplicationDomainServiceBase
    {
        private string _accessToken;

        public async Task<TenPayV3Info> GetTenPayV3InfoAsync(int tenantId,string tenPayV3Notify)
        {
            string appId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, tenantId);
            string appSecret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, tenantId);
            string mchId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.Pay.MchId, tenantId);
            string key = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.Pay.Key, tenantId);
            TenPayV3Info tenPayV3Info = new TenPayV3Info(appId, appSecret, mchId, key, tenPayV3Notify);
            return tenPayV3Info;
        }

        public async Task<string> GetAccessTokenAsync()
        {
            if (_accessToken != null)
            {
                return _accessToken;
            }
            string appId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, InfrastructureSession.TenantId.Value);
            string secret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, InfrastructureSession.TenantId.Value);
            _accessToken = AccessTokenContainer.TryGetAccessToken(appId, secret);
            return _accessToken;
        }

        public async Task<string> RefreshAccessToken()
        {
            string appId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, InfrastructureSession.TenantId.Value);
            string secret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, InfrastructureSession.TenantId.Value);
            string accessToken=await AccessTokenContainer.TryGetAccessTokenAsync(appId, secret, true);
            return accessToken;
        }

        public async Task<string> GetAccessTokenAsync(int tenantId)
        {
            if(_accessToken != null)
            {
                return _accessToken;
            }
            string appId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, tenantId);
            string secret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, tenantId);
            _accessToken = AccessTokenContainer.TryGetAccessToken(appId, secret);
            return _accessToken;
        }
    }
}
