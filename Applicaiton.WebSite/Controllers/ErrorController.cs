using Application.WebSite.Models;
using Infrastructure.Auditing;
using System.Web.Mvc;

namespace Application.WebSite.Controllers
{
    public class ErrorController : ApplicationControllerBase
    {
        [DisableAuditing]
        public ActionResult E403()
        {
            return View("Error",new ErrorModel()
            {
                Code = 403,
                Detail = L("WeCanNotFindThePage")
            });
        }

        [DisableAuditing]
        public ActionResult E400()
        {
            return View("Error", new ErrorModel()
            {
                Code = 403,
                Detail = L("WeCanNotFindThePage")
            });
        }

        [DisableAuditing]
        public ActionResult E404()
        {
            return View("Error", new ErrorModel()
            {
                Code = 403,
                Detail = L("WeCanNotFindThePage")
            });
        }

        [DisableAuditing]
        public ActionResult E500()
        {
            return View("Error", new ErrorModel()
            {
                Code = 403,
                Detail = L("WeCanNotFindThePage")
            });
        }

        [DisableAuditing]
        public ActionResult WebSiteOff()
        {
            return View();
        }
    }
}