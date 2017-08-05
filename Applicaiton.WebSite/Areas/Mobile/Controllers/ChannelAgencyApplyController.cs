using Infrastructure.Application.DTO;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ChannelAgencyApplyController : AuthorizationMobileControllerBase
    {
        public ActionResult Detail(IdInput input)
        {
            return View(input);
        }
    }
}