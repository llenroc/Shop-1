using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Controllers
{
    public class AboutController : AnonymousHomeControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}