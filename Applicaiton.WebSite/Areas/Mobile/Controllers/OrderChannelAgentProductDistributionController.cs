using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class OrderChannelAgentProductDistributionController : AuthorizationMobileControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}