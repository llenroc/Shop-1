using Application.Orders.Events;
using Application.Wechats;
using Application.Wechats.TemplateMessages;
using Application.Wechats.TemplateMessages.TemplateMessageDatas;
using Infrastructure;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;
using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;

namespace Application.Orders.EventHandlers
{
    public class CommonOrderCreatedEventHandler:ApplicationDomainServiceBase, IEventHandler<OrderCreatedEventData>, ISingletonDependency 
    {
        public TemplateMessageManager TemplateMessageManager { get; set; }
        public WechatUserManager WechatUserManager { get; set; }

        public void HandleEvent(OrderCreatedEventData eventData)
        {
            AsyncHelper.RunSync(async() =>
            {
                string openid = WechatUserManager.GetOpenid(new UserIdentifier(eventData.Order.TenantId, eventData.Order.UserId));

                if (!string.IsNullOrEmpty(openid))
                {
                    OrderCreatedTemplateMessageData data = new OrderCreatedTemplateMessageData(
                        new TemplateDataItem(eventData.Order.Title),
                        new TemplateDataItem(eventData.Order.Number),
                        new TemplateDataItem(eventData.ProductCount.ToString()),
                        new TemplateDataItem(eventData.Order.Money.ToString()),
                        new TemplateDataItem(L("ThankYouForYourPatronage"))
                        );
                    await TemplateMessageManager.SendTemplateMessageOfOrderCreatedAsync(eventData.Order.TenantId, openid, OrderHelper.GetOrderDetailUrl(eventData.Order.Id), data);
                }
            });

        }
    }
}
