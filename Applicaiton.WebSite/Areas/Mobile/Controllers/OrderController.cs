using Application.CustomerInfos;
using Application.Customers;
using Application.WebSite.Areas.Mobile.Models.Orders;
using Infrastructure.Application.DTO;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class OrderController : AuthorizationMobileControllerBase
    {
        public CustomerInfoManager CustomerInfoManager { get; set; }

        public ActionResult Index()
        {
            ViewBag.PageTitle = L("OrderManager");
            return View();
        }

        public ActionResult Detail(IdInput input)
        {
            ViewBag.PageTitle = L("OrderManager");
            return View(input);
        }

        public ActionResult Comment(IdInput input)
        {
            ViewBag.PageTitle = L("Comment");
            return View(input);
        }


        public ActionResult ConfirmOrder(OrderConfirmInputViewModel input)
        {
            ViewBag.PageTitle = L("ConfirmOrder");
            ViewBag.ReturnUrl = Request.RawUrl;

            if (!input.CustomerInfoId.HasValue)
            {
                CustomerInfo customerInfo = CustomerInfoManager.GetDefaultCustomerInfo(InfrastructureSession.UserId.Value);

                if (customerInfo != null)
                {
                    input.CustomerInfoId =customerInfo.Id;
                }
            }
            return View(input);
        }

        public ActionResult ConfirmOrderForShopCart(OrderConfirmForShopCartInputViewModel input)
        {
            ViewBag.PageTitle = L("ConfirmOrderForShopCart");
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