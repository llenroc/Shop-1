using Infrastructure.Authorization;
using Infrastructure.Event.Bus;
using Infrastructure.Web.Models;
using Infrastructure.Web.Mvc.Authorization;
using System.Reflection;
using System.Web.Mvc;

namespace Application.WebSite.Filters
{
    public class WebMvcAuthorizeFilter : MvcAuthorizeFilter
    {
        public WebMvcAuthorizeFilter(
            IAuthorizationHelper authorizationHelper,
            IErrorInfoBuilder errorInfoBuilder,
            IEventBus eventBus) : base(
                authorizationHelper,
                errorInfoBuilder,
                eventBus)
        {
        }

        protected override void HandleUnauthorizedRequest(
            AuthorizationContext filterContext,
            MethodInfo methodInfo,
            AuthorizationException ex)
        {
            base.HandleUnauthorizedRequest(filterContext, methodInfo, ex);
        }
    }
}