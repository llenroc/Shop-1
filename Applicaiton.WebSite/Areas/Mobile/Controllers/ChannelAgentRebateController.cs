using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ChannelAgentRebateController : AuthorizationMobileControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}