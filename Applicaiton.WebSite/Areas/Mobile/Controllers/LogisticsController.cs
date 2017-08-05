using Application.Orders;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class LogisticsController : AnonymousMobileControllerBase
    {
        // GET: Mobile/Logistics
        public ActionResult Detail(ExpressInfo expressInfo)
        {
            return View(expressInfo);
        }
    }
}