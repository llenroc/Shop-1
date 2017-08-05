using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class GroupController : AuthorizationMobileControllerBase
    {
        // GET: Mobile/Group
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CustomerList(int depth=1)
        {
            return View(depth);
        }

        public ActionResult PotentialCustomerList()
        {
            return View();
        }
    }
}