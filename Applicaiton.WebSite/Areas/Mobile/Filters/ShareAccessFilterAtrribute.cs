using Infrastructure.Dependency;
using Infrastructure.Runtime.Session;
using Infrastructure.Threading;
using System.Web.Mvc;
using Utility.Common;
using Application.Spread.Shares;

namespace Application.WebSite.Areas.Mobile.Filters
{
    public class ShareAccessFilterAtrribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                string shareNo = filterContext.HttpContext.Request.Params["shareNo"];

                if (shareNo.HasValue())
                {
                    IInfrastructureSession infrastructureSession = IocManager.Instance.Resolve<IInfrastructureSession>();

                    if (infrastructureSession.UserId.HasValue)
                    {
                        ShareManager ShareManager = IocManager.Instance.Resolve<ShareManager>();
                        AsyncHelper.RunSync(async() =>
                        {
                            await ShareManager.ProcessShareAccessAsync(shareNo, infrastructureSession.UserId.Value);
                        });
                    }
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}