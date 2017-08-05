using Infrastructure.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ChannelAgencyController : AuthorizationMobileControllerBase
    {
        // GET: Mobile/ChannelAgency
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CustomerList(IdInput input)
        {
            return View(input);
        }

        public ActionResult Certificate()
        {
            return View();
        }
    }
}