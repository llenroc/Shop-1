using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class SpreadController : AuthorizationMobileControllerBase
    {
        // GET: Mobile/Spread
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Shares()
        {
            return View();
        }

        public ActionResult Qrcode()
        {
            return View();
        }
    }
}