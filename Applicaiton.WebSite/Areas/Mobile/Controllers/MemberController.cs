using Application.Members;
using Application.Members.MemberCards;
using Application.Members.MemberCards.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class MemberController : AuthorizationMobileControllerBase
    {
        public MemberCardAppService MemberCardAppService { get; set; }

        // GET: Mobile/Member
        public ActionResult Index()
        {
            return View();
        }
    }
}