using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class CustomerInfoController : AuthorizationMobileControllerBase
    {
        public ActionResult Index(string ReturnUrl=null)
        {
            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }
    }
}