using Application.Configuration;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using System.Web.Mvc;

namespace Application.WebSite.Filters
{
    public class WebSiteStatusFilter: ActionFilterAttribute
    {
        public bool Enabled { get; set; } = true;
        private ISettingManager SettingManager { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Enabled&&!filterContext.IsChildAction)
            {
                ISettingManager SettingManager = IocManager.Instance.Resolve<ISettingManager>();
                bool webSiteStatus = SettingManager.GetSettingValue<bool>(AppSettings.General.WebSiteStatus);

                if (!webSiteStatus)
                {
                    filterContext.Result = new RedirectResult("/Error/WebSiteOff");
                    return;
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}