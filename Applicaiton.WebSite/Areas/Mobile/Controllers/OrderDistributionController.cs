using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class OrderDistributionController : AuthorizationMobileControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}