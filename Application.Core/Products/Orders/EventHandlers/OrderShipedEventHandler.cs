using Application.Expresses;
using Application.Orders;
using Application.Orders.Events;
using Application.Wechats;
using Application.Wechats.TemplateMessages;
using Application.Wechats.TemplateMessages.TemplateMessageDatas;
using Infrastructure;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;
using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;

namespace Application.Products.Orders.EventHandlers
{
    public class OrderShipedEventHandler :ApplicationDomainServiceBase, IEventHandler<OrderShipedEventData>, ITransientDependency
    {
        public WechatUserManager WechatUserManager { get; set; }
        public TemplateMessageManager TemplateMessageManager { get; set; }
        public IRepository<ExpressCompany> ExpressCompanyRepository { get; set; }

        public void HandleEvent(OrderShipedEventData eventData)
        {
            AsyncHelper.RunSync(async () =>
            {
                string openid = WechatUserManager.GetOpenid(new UserIdentifier(eventData.Order.TenantId, eventData.Order.UserId));

                if (String.IsNullOrEmpty(openid))
                {
                    return;
                }
                OrderShipedTemplateMessageData data = new OrderShipedTemplateMessageData()
                {
                    first = new TemplateDataItem(eventData.Order.Title),
                    keyword1 = new TemplateDataItem(eventData.Order.Number),
                    keyword4 = new TemplateDataItem(eventData.Order.CreationTime.ToString()),
                    remark = new TemplateDataItem(L("ThankYouForYourPatronage"))
                };

                if (eventData.ExpressInfo != null)
                {
                    ExpressCompany expressCompany = ExpressCompanyRepository.Get(eventData.ExpressInfo.ExpressCompanyId);
                    data.keyword2 = new TemplateDataItem(expressCompany.Name);
                    data.keyword3 = new TemplateDataItem(eventData.ExpressInfo.TrackingNumber);
                }
                else
                {
                    data.keyword2 = new TemplateDataItem(L("Null"));
                    data.keyword3 = new TemplateDataItem(L("Null"));
                }
                await TemplateMessageManager.SendTemplateMessageOfOrderShipedAsync(eventData.Order.TenantId, openid, OrderHelper.GetOrderDetailUrl(eventData.Order.Id), data);
            });
        }
    }
}
