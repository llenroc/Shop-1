using Application;

namespace Infrastructure.Web.Mvc.Views
{
    public abstract class LibraryWebViewPageBase : LibraryWebViewPageBase<dynamic>
    {
    }

    public abstract class LibraryWebViewPageBase<TModel> : WebViewPageBase<TModel>
    {
        protected LibraryWebViewPageBase()
        {
            LocalizationSourceName = ApplicationConsts.LocalizationSourceName;
        }
    }
}