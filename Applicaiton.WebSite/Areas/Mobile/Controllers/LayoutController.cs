using Application.Configuration;
using Application.Configuration.Host;
using Application.WebSite.Areas.Mobile.Models.Layout;
using Application.Wechats.PublicWechats;
using Application.Wechats.PublicWechats.Dto;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class LayoutController : AnonymousMobileControllerBase
    {
        public IHostSettingsAppService HostSettingsAppService { get; set; }
        public IPublicWechatSettingsAppService PublicWechatSettingsAppService { get; set; }

        [ChildActionOnly]
        public async Task<PartialViewResult> Header(string PageTitle = null)
        {
            var headerModel = new HeaderViewModel
            {
                CurrentLoginInformations =SessionAppService.GetCurrentLoginInformations(),
                AppSettings= HostSettingsAppService.GetAppSettings()
            };

            if (InfrastructureSession.TenantId.HasValue)
            {
                headerModel.GeneralSettingsDto = new GeneralSettingsDto
                {
                    Token = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Token, InfrastructureSession.TenantId.Value),
                    AppId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, InfrastructureSession.TenantId.Value),
                    Secret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, InfrastructureSession.TenantId.Value),
                    EncodingAESKey = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.EncodingAESKey, InfrastructureSession.TenantId.Value),
                    SubscribeLink = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.SubscribeLink, InfrastructureSession.TenantId.Value),
                };
            }
            ViewBag.PageTitle = PageTitle;
            return PartialView(headerModel);
        }

        [ChildActionOnly]
        public PartialViewResult Nav()
        {
            var navModel = new NavViewModel
            {
            };
            return PartialView(navModel);
        }

        [ChildActionOnly]
        public PartialViewResult Footer()
        {
            return PartialView();
        }
    }
}