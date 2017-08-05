using Infrastructure.Extensions;

namespace System.Web.Mvc
{
    public static class HtmlHelpersExtension
    {
        public static string GetAreaName(this HtmlHelper htmlHelper)
        {
            string areaName;
            var areaDataToken = htmlHelper.ViewContext.RouteData.DataTokens["area"];

            if (areaDataToken == null)
            {
                return null;
            }
            areaName = htmlHelper.ViewContext.RouteData.DataTokens["area"].ToString();
            return areaName;
        }

        public static string GetVirtualAreaName(this string areaName)
        {
            if (areaName.IsNullOrEmpty())
            {
                areaName = "Home";
            }
            return areaName;
        }
    }
}