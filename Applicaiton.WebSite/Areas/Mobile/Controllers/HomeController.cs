using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class HomeController : AuthorizationMobileControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}