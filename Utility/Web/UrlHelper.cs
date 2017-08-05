using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Utility.Web
{
    public static class UrlHelper
    {
        public static string GetFullUrl(string url)
        {
            var currentUrl = HttpContext.Current.Request.Url;
            return currentUrl.Scheme + System.Uri.SchemeDelimiter
                + currentUrl.Host + (currentUrl.IsDefaultPort ? "" : ":" + currentUrl.Port)
                + url;
        }
    }
}
