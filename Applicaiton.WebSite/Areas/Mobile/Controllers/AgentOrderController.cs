using Application.CustomerInfos;
using Application.Customers;
using Application.WebSite.Areas.Mobile.Models.AgentOrder;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class AgentOrderController : AuthorizationMobileControllerBase
    {
        public CustomerInfoManager CustomerInfoManager { get; set; }

        // GET: Mobile/AgentOrder
        public ActionResult Index(OrderConfirmInputViewModel input)
        {
            ViewBag.PageTitle = L("ConfirmOrder");
            ViewBag.ReturnUrl = Request.RawUrl;

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