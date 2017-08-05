using Application.Members.MemberCardPackages;
using Application.Members.MemberCardPackages.Dto;
using Infrastructure.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class MemberCardPackageController : AuthorizationMobileControllerBase
    {
        public MemberCardPackageAppService MemberCardPackageAppService { get; set; }

        // GET: Mobile/MemberCardPackage
        public ActionResult Index()
        {
            return View();
        }
    }
}