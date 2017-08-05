using Application.WebSite.Filters;

namespace Application.WebSite.Controllers
{
    [WebSiteStatusFilter]
    public abstract class HomeControllerBase : ApplicationControllerBase
    {
    }
}