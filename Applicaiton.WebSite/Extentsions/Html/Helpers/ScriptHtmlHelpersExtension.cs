using Application.WebSite.Helpers;
using Infrastructure.Extensions;
using System.IO;
using System.Text;

namespace System.Web.Mvc
{
    public static class ScriptHtmlHelpersExtension
    {
        public static string GetBasePath(string areaName)
        {
            string path;

            if (areaName.IsNullOrEmpty())
            {
                path = "/Resource/Scripts/";
            }
            else
            {
                path = "/Resource/Scripts/App/";
            }
            return path;
        }

        public static MvcHtmlString GetAreaScripts(this HtmlHelper htmlHelper, SearchOption searchOption = SearchOption.TopDirectoryOnly)
        {
            string areaName = htmlHelper.GetAreaName();
            string path= GetBasePath(areaName);
            path += areaName.GetVirtualAreaName() + "/";
            return MvcHtmlString.Create(GetScriptsForPath(path, searchOption));
        }

        public static MvcHtmlString GetControllerScripts(this HtmlHelper htmlHelper, SearchOption searchOption = SearchOption.TopDirectoryOnly,string controllerName=null)
        {
            string areaName = htmlHelper.GetAreaName();

            if (String.IsNullOrEmpty(controllerName))
            {
                controllerName = htmlHelper.ViewContext.RouteData.GetRequiredString("controller");
            }
            string path = GetBasePath(areaName);

            path += areaName.GetVirtualAreaName() + "/"+controllerName+"/";
            return MvcHtmlString.Create(GetScriptsForPath(path, searchOption));
        }

        public static MvcHtmlString GetActionScripts(this HtmlHelper htmlHelper, string actionName = null)
        {
            string areaName = htmlHelper.GetAreaName();
            string controllerName = htmlHelper.ViewContext.RouteData.GetRequiredString("controller");

            if (String.IsNullOrEmpty(actionName))
            {
                actionName = htmlHelper.ViewContext.RouteData.GetRequiredString("action");
            }
            string path = GetBasePath(areaName);

            path += areaName.GetVirtualAreaName() + "/" + controllerName + "/"+actionName+"/";
            return MvcHtmlString.Create(GetScriptsForPath(path,SearchOption.AllDirectories));
        }

        public static MvcHtmlString GetActionScript(this HtmlHelper htmlHelper)
        {
            string areaName = htmlHelper.GetAreaName();
            string controllerName = htmlHelper.ViewContext.RouteData.GetRequiredString("controller");
            string actionName = htmlHelper.ViewContext.RouteData.GetRequiredString("action");
            string path = GetBasePath(areaName);

            path += areaName.GetVirtualAreaName() + "/" + controllerName + "/" + actionName.ToCamelCase() + ".js";

            if (File.Exists(HttpContext.Current.Server.MapPath("~"+ path)))
            {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("<script src='");
                stringBuilder.Append(path);
                stringBuilder.Append("'></script>");
                return MvcHtmlString.Create(stringBuilder.ToString());
            }
            return MvcHtmlString.Empty;
        }

        private static string GetScriptsForPath(string path, SearchOption searchOption= SearchOption.TopDirectoryOnly)
        {
            DirectoryInfo folder = new DirectoryInfo(HttpContext.Current.Server.MapPath("~" + path));

            try
            {
                var pathInfos = folder.GetFiles("*.js", searchOption);
                string rootPath = HttpContext.Current.Server.MapPath("/");
                StringBuilder stringBuilder = new StringBuilder();

                foreach (FileInfo file in pathInfos)
                {
                    string relativePath = PathHelper.ToRelativePath(rootPath, file.FullName);
                    relativePath=relativePath.Replace("\\","/");

                    stringBuilder.Append("<script src='");
                    stringBuilder.Append("/" + relativePath);
                    stringBuilder.Append("'></script>");
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