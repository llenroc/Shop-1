using System;
using System.Web.Mvc;

namespace System.Web.Mvc
{
    public static class DateTimeHtmlHelperExtension
    {
        public static string FormatDateTime(this HtmlHelper helper,DateTime dateTime,string format= "yyyy-MM-dd HH:mm:ss")
        {
            return dateTime.ToString(format);
        }
    }
}