using Application.Shops;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Runtime.Session;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Filters
{
    public class PageTitleFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            ISettingManager settingManager = IocManager.Instance.Resolve<ISettingManager>();
            IInfrastructureSession infrastructureSession= IocManager.Instance.Resolve<IInfrastructureSession>();

            if (infrastructureSession.TenantId.HasValue)
            {
                string shopName = settingManager.GetSettingValueForTenant(ShopSettings.General.Name, infrastructureSession.TenantId.Value);
                filterContext.Controller.ViewBag.PageTitle = shopName;
            }
            base.OnActionExecuting(filterContext);
        }
    }
}