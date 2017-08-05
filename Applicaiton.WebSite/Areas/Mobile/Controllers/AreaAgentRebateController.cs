using Infrastructure.Application.DTO;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class AreaAgentRebateController : AuthorizationMobileControllerBase
    {
        // GET: Mobile/AreaAgent
        public ActionResult Index(IdInput input)
        {
            return View(input);
        }
    }
}