using Application.CustomerInfos;
using Application.Customers;
using Application.WebSite.Areas.Mobile.Models.ChannelAgent;
using Infrastructure.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ChannelAgentController : AuthorizationMobileControllerBase
    {
        public CustomerInfoManager CustomerInfoManager { get; set; }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Apply(ChannelAgentApplyViewModel input)
        {

            if (!input.CustomerInfoId.HasValue)
            {
                CustomerInfo customerInfo = CustomerInfoManager.GetDefaultCustomerInfo(InfrastructureSession.UserId.Value);

                if (customerInfo != null)
                {
                    input.CustomerInfoId = customerInfo.Id;
                }
            }
            return View(input);
        }
    }
}