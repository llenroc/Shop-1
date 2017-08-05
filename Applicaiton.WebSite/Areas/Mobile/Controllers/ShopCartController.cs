using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ShopCartController : AuthorizationMobileControllerBase
    {
        // GET: Mobile/ShoppingCart
        public ActionResult Index()
        {
            ViewBag.PageTitle = L("MyShopCart");
            return View();
        }
    }
}