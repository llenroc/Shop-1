using Infrastructure.Application.DTO;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class AreaAgentController : AuthorizationMobileControllerBase
    {
        // GET: Mobile/AreaAgent
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Apply(IdInput input)
        {
            return View(input);
        }
    }
}