using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ProfileController : AuthorizationMobileControllerBase
    {
        // GET: Mobile/Profile
        public ActionResult Detail()
        {
            return View();
        }
    }
}