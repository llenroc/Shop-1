using Infrastructure.Application.DTO;
using System.Text;

namespace System.Web.Mvc
{
    public static class PaginationHtmlHelpersExtension
    {
        public static string GetPagedUrl(this string url, int currentIndex, int pageIndex)
        {
            return url.Replace("PageIndex=" + currentIndex.ToString(), "PageIndex=" + pageIndex.ToString());
        }

        public static MvcHtmlString Pagination<T>(this HtmlHelper helper, IPagedResult<T> pagedResult)
        {
            var requestUrl = helper.ViewContext.RequestContext.HttpContext.Request.Url.AbsolutePath;
            int pageIndex = pagedResult.PageIndex;
            int totalCount = pagedResult.TotalCount;
            int pageSize = pagedResult.PageSize;
            int pageCount = (int)Math.Ceiling((double)totalCount/pageSize);
            int currentIndex = pageIndex;

            if (pageCount < 1)
            {
                return new MvcHtmlString("");
            }

            if (pageIndex == 0)
                pageIndex = 1;

            if (requestUrl.IndexOf("?", StringComparison.Ordinal) == -1)
            {
                currentIndex = 1;
                requestUrl += "?PageIndex=" + currentIndex;
            }
            else if (requestUrl.IndexOf("&PageIndex", StringComparison.Ordinal) == -1 && requestUrl.IndexOf("?PageIndex", StringComparison.Ordinal) == -1)
            {
                currentIndex = 1;
                requestUrl += "&PageIndex=" + currentIndex;
            }

            var output = new StringBuilder();
            output.Append("<div class='pagination-container'><ul class='pagination'>");

            if (pageCount > 1)
            {
                if (pageIndex != 1)
                {
                    //处理首页连接
                    output.AppendFormat("<li><a href='{0}'><<</a></li>", requestUrl.GetPagedUrl(currentIndex, 1));
                }

                if (pageIndex > 1)
                {
                    //处理上一页的连接
                    output.AppendFormat("<li><a href='{0}'><</a></li>", requestUrl.GetPagedUrl(currentIndex, pageIndex - 1));
                }
            }
            int currint = 5;

            for (int i = 0; i <= 10; i++)
            {
                //一共最多显示10个页码，前面5个，后面5个
                if ((pageIndex + i - currint) >= 1 && (pageIndex + i - currint) <= pageCount)
                {
                    if (currint == i)
                    {
                        //当前页处理
                        output.AppendFormat("<li class='current'><a>{1}</a></li>", requestUrl.GetPagedUrl(currentIndex, pageIndex), pageIndex);
                    }
                    else
                    {
                        //一般页处理
                        output.AppendFormat("<li><a href='{0}'>{1}</a></li>", requestUrl.GetPagedUrl(currentIndex, pageIndex + i - currint), pageIndex + i - currint);
                    }
                }
            }

            if (pageIndex < pageCount)
            {
                //处理下一页的链接
                output.AppendFormat("<li><a href='{0}'>></a></li>", requestUrl.GetPagedUrl(currentIndex,pageIndex+1));
            }

            if (pageIndex != pageCount)
            {
                output.AppendFormat("<li><a href='{0}'>>></a></li>", requestUrl.GetPagedUrl(currentIndex, pageCount + 1));
            }
            output.Append("</div></ul>");
            return new MvcHtmlString(output.ToString());
        }
    }
}