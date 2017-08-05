using Application.Orders.Events;
using Application.Scores;
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
    public class CommonOrderPayedEventHandler : ApplicationDomainServiceBase, IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public TemplateMessageManager TemplateMessageManager { get; set; }
        public WechatUserManager WechatUserManager { get; set; }
        public ScoreManager ScoreManager { get; set; }

        public void HandleEvent(OrderPayedEventData eventData)
        {
            AsyncHelper.RunSync(async() =>
            {
                string openid = WechatUserManager.GetOpenid(new UserIdentifier(eventData.Order.TenantId, eventData.Order.UserId));

                if (!string.IsNullOrEmpty(openid))
                {
                    OrderPayedTemplateMessageData data = new OrderPayedTemplateMessageData(
                        new TemplateDataItem(eventData.Order.Title),
                        new TemplateDataItem(eventData.Order.Number),
                        new TemplateDataItem(eventData.Order.PaymentDatetime.ToString()),
                        new TemplateDataItem(eventData.Order.PayMoney.ToString()),
                        new TemplateDataItem(eventData.Order.PayType.ToString()),
                        new TemplateDataItem(L("ThankYouForYourPatronage"))
                        );
                    await TemplateMessageManager.SendTemplateMessageOfOrderPayedAsync(eventData.Order.TenantId, openid, OrderHelper.GetOrderDetailUrl(eventData.Order.Id), data);
                }

            });
        }
    }
}
