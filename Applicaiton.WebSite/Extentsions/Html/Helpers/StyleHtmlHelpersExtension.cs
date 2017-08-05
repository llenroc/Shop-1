using Application.WebSite.Helpers;
using Infrastructure.Extensions;
using System.IO;
using System.Text;

namespace System.Web.Mvc
{
    public static class StyleHtmlHelpersExtension
    {
        public static string GetBasePath(string areaName)
        {
            string path;

            if (areaName.IsNullOrEmpty())
            {
                path = "/Resource/Styles/";
            }
            else
            {
                path = "/Resource/Styles/App/";
            }
            return path;
        }

        public static MvcHtmlString GetAreaStyles(this HtmlHelper htmlHelper, SearchOption searchOption = SearchOption.TopDirectoryOnly)
        {
            string areaName = htmlHelper.GetAreaName();
            string path = GetBasePath(areaName);
            path += areaName.GetVirtualAreaName() + "/";
            return MvcHtmlString.Create(GetStylesForPath(path, searchOption));
        }

        public static MvcHtmlString GetControllerStyles(this HtmlHelper htmlHelper,string controllerName=null)
        {
            string areaName = htmlHelper.GetAreaName();

            if (String.IsNullOrEmpty(controllerName))
            {
                controllerName = htmlHelper.ViewContext.RouteData.GetRequiredString("controller");
            }
            string path = GetBasePath(areaName);
            path += areaName.GetVirtualAreaName() + "/" + controllerName + "/";
            return MvcHtmlString.Create(GetStylesForPath(path));
        }

        public static MvcHtmlString GetActionStyles(this HtmlHelper htmlHelper,string actionName=null, string controllerName = null)
        {
            string areaName = htmlHelper.GetAreaName();

            if (String.IsNullOrEmpty(controllerName))
            {
                controllerName = htmlHelper.ViewContext.RouteData.GetRequiredString("controller");
            }

            if (String.IsNullOrEmpty(actionName))
            {
                actionName = htmlHelper.ViewContext.RouteData.GetRequiredString("action");
            }
            string path = GetBasePath(areaName);
            path += areaName.GetVirtualAreaName() + "/" + controllerName + "/" + actionName + "/";
            return MvcHtmlString.Create(GetStylesForPath(path,SearchOption.AllDirectories));
        }

        public static MvcHtmlString GetActionStyle(this HtmlHelper htmlHelper, string actionName = null, string controllerName = null)
        {
            string areaName = htmlHelper.GetAreaName();

            if (String.IsNullOrEmpty(controllerName))
            {
                controllerName = htmlHelper.ViewContext.RouteData.GetRequiredString("controller");
            }

            if (String.IsNullOrEmpty(actionName))
            {
                actionName = htmlHelper.ViewContext.RouteData.GetRequiredString("action");
            }
            string path = GetBasePath(areaName);

            path += areaName.GetVirtualAreaName()  + "/" + controllerName + "/" + actionName.ToCamelCase() + ".css";

            if (File.Exists(HttpContext.Current.Server.MapPath("~" + path)))
            {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("<link href='");
                stringBuilder.Append(path);
                stringBuilder.Append("' rel='stylesheet' type='text/css'/>");
                return MvcHtmlString.Create(stringBuilder.ToString());
            }
            return MvcHtmlString.Empty;
        }

        private static string GetStylesForPath(string path, SearchOption searchOption = SearchOption.TopDirectoryOnly)
        {
            DirectoryInfo folder = new DirectoryInfo(HttpContext.Current.Server.MapPath("~" + path));

            try
            {
                var pathInfos = folder.GetFiles("*.css", searchOption);
                string rootPath = HttpContext.Current.Server.MapPath("/");
                StringBuilder stringBuilder = new StringBuilder();

                foreach (FileInfo file in pathInfos)
                {
                    string relativePath = PathHelper.ToRelativePath(rootPath, file.FullName);
                    relativePath = relativePath.Replace("\\", "/");

                    stringBuilder.Append("<link href='");
                    stringBuilder.Append("/" + relativePath);
                    stringBuilder.Append("' rel='stylesheet' type='text/css'/>");
                }
                return stringBuilder.ToString();
            }
            catch (DirectoryNotFoundException e)
            {
                return null;
            }
        }
    }
}