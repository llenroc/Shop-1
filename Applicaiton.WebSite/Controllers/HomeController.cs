using System.Web.Mvc;

namespace Application.WebSite.Controllers
{
    public class HomeController : AnonymousHomeControllerBase
    {
        // GET: Home/Index
        public ActionResult Index()
        {
            return View();
        }
    }
}