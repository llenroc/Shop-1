using Infrastructure.Dependency;
using Infrastructure.Runtime.Session;
using Infrastructure.Threading;
using System.Web.Mvc;
using Utility.Common;
using Application.Spread.Shares;
using Application.Authorization.Users;
using Application.WebSite.Areas.Mobile.Models.Authorization;

namespace Application.WebSite.Areas.Mobile.Filters
{
    public class ShareAccessFilterAtrribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.IsChildAction)
            {
                return;
            }

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
                            Share share= await ShareManager.ProcessShareAccessAsync(shareNo, infrastructureSession.UserId.Value);

                            if (share != null)
                            {
                                filterContext.Controller.ViewBag.ShareUserProfile = new BusinessCardInfo
                                {
                                    NickName=share.CreatorUser.NickName,
                                    Avatar= share.CreatorUser.Avatar,
                                    FullName =share.CreatorUser.UserDetail.FullName,
                                    PhoneNumber = share.CreatorUser.UserDetail.PhoneNumber,
                                    WechatName = share.CreatorUser.UserDetail.WechatName,
                                    IdentityNumber = share.CreatorUser.UserDetail.IdentityNumber,
                                    QrcodePath = share.CreatorUser.UserDetail.QrcodePath,
                                };
                            }
                        });
                    }
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}