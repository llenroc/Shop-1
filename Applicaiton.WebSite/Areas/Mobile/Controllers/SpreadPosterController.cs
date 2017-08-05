using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class SpreadPosterController : AuthorizationMobileControllerBase
    {
        public ActionResult Index()
        {
            ViewBag.PageTitle = L("MySpreadPoster");
            return View();
        }

        public ActionResult List()
        {
            ViewBag.PageTitle = L("SpreadPosterCenter");
            return View();
        }
    }
}