using Application.AreaAgents.Front.Dto;
using Infrastructure.Application.DTO;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class AreaAgencyController : AuthorizationMobileControllerBase
    {
        // GET: Mobile/AreaAgency
        public ActionResult Index(IdInput input)
        {
            return View(input);
        }

        public ActionResult AreaAgencyAreas(AreaAgencyAreasGetInput input)
        {
            return View(input);
        }

        public ActionResult CustomerList(IdInput input)
        {
            return View(input);
        }

        public ActionResult Certificate(IdInput input)
        {
            return View(input);
        }
    }
}