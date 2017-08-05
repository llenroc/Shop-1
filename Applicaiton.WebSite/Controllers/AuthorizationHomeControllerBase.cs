using Infrastructure.Web.Mvc.Authorization;

namespace Application.WebSite.Controllers
{
    [MvcAuthorize]
    public abstract class AuthorizationHomeControllerBase : HomeControllerBase
    {
    }
}