using Application.Configuration.Host;
using Application.WebSite.Areas.Manager.Models.Layout;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Manager.Controllers
{
    public class HomeController : ManagerControllerBase
    {
        public IHostSettingsAppService HostSettingsAppService { get; set; }

        public ActionResult Index()
        {
            var headerModel = new HeaderViewModel
            {
                AppSettings = HostSettingsAppService.GetAppSettings()
            };
            return View("~/Areas/Manager/Views/Shared/_Layout.cshtml",headerModel);
        }
    }
}