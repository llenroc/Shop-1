using Application.Sessions;
using Application.WebSite.Controllers;
using Application.WebSite.Filters;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    [WebSiteStatusFilter]
    public class MobileControllerBase : ApplicationControllerBase
    {
        public ISessionAppService SessionAppService { get; set; }
    }
}