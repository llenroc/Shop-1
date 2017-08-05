using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Application.Orders
{
    public static class OrderHelper
    {
        public static string GetOrderDetailUrl(int orderId)
        {
            UrlHelper userHelper = new UrlHelper();
            RouteValueDictionary routeValueDictionary = new RouteValueDictionary();
            routeValueDictionary["are"] = "Mobile";
            routeValueDictionary["id"] = orderId;
            string url = "http://" + HttpContext.Current.Request.Url.Host + "/Mobile/Order/Detail?id=" + orderId;
            return null;
        }
    }
}
