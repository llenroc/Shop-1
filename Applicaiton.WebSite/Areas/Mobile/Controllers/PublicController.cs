using Application.Configuration;
using Senparc.Weixin.MP.Helpers;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class PublicController : AuthorizationMobileControllerBase
    {
        public async Task<JsonResult> GetJsTicketParameters()
        {
            string appId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, InfrastructureSession.TenantId.Value);
            string appSecret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, InfrastructureSession.TenantId.Value);
            JsSdkUiPackage jssdkUiPackage = JSSDKHelper.GetJsSdkUiPackage(appId, appSecret, Request.UrlReferrer.ToString());
            return Json(jssdkUiPackage);
        }
    }
}