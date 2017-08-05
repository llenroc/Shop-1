using Application.Authorization.Users.Events;
using Application.Wechats;
using Application.Wechats.TemplateMessages;
using Application.Wechats.TemplateMessages.TemplateMessageDatas;
using Infrastructure;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;
using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;

namespace Application.Authorization.Users.EventHandlers
{
    public class BindParentEventHandler:ApplicationDomainServiceBase, IEventHandler<BindParentEventData>, ISingletonDependency 
    {
        public WechatUserManager WechatUserManager { get; set; }
        public TemplateMessageManager TemplateMessageManager { get; set; }

        public void HandleEvent(BindParentEventData eventData)
        {
            AsyncHelper.RunSync(async () =>
            {
                string openid = WechatUserManager.GetOpenid(new UserIdentifier(eventData.ParentUser.TenantId, eventData.ParentUser.Id));

                if (string.IsNullOrEmpty(openid))
                {
                    return;
                }
                NewCustomerTemplateMessageData data = new NewCustomerTemplateMessageData(
                    new TemplateDataItem(L("YouHasANewCustomer")),
                    new TemplateDataItem(eventData.SourceUser.UserName),
                    new TemplateDataItem(eventData.SourceUser.NickName),
                    new TemplateDataItem(eventData.SourceUser.CreationTime.ToString("yyyy-MM-dd hh:mm:ss")),
                    new TemplateDataItem(L("ThankYouForYourPatronage"))
                    );
                await TemplateMessageManager.SendTemplateMessageOfNewCustomerAsync(eventData.ParentUser.TenantId.Value, openid, "", data);
            });
        }
    }
}
