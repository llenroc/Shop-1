using Application.CustomerInfos;
using Application.Customers;
using Application.WebSite.Areas.Mobile.Models.ScoreExchange;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ScoreShopController : AuthorizationMobileControllerBase
    {
        public CustomerInfoManager CustomerInfoManager { get; set; }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Exchange(ScoreExchangeOrderConfirmInputViewModel input)
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