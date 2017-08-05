namespace Utility.Web
{
    public class PathHelper
    {
        public static string GetAbsolutePath(string path)
        {
            //return Path.Combine(HttpRuntime.AppDomainAppPath, path);
            return System.Web.Hosting.HostingEnvironment.MapPath("~"+ path);
        }
    }
}
