using Application.Orders.Events;
using Application.Products.Orders.Entities;
using Application.Shops;
using Application.Wechats;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Threading;
using System;

namespace Application.Products.Orders.EventHandlers
{
    public class ProductOrderPayeddEventHandler : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public ISettingManager SettingManager { get; set; }
        public ProductManager ProductManager { get; set; }
        public CustomerServiceMessageHelper CustomerServiceMessageHelper { get; set; }
        public WechatCommonManager WechatCommonManager { get; set; }
        public WechatUserManager WechatUserManager { get; set; }

        public void HandleEvent(OrderPayedEventData eventData)
        {
            if (eventData.Order is ProductOrder)
            {
                ProductOrder order = eventData.Order as ProductOrder;
                DecreaseStockWhen DecreaseStockWhen = (DecreaseStockWhen)(Enum.Parse(typeof(DecreaseStockWhen),
                   SettingManager.GetSettingValueForTenant(ShopSettings.General.DecreaseStockWhen, eventData.Order.TenantId)));

                if (order.OrderItems != null)
                {
                    foreach (OrderItem orderItem in order.OrderItems)
                    {
                        //Decreate stock
                        if (DecreaseStockWhen == DecreaseStockWhen.Pay)
                        {
                            ProductManager.DecreaseStock(orderItem.Specification, orderItem.Count);
                        }

                        //Increse sale
                        ProductManager.IncreaseSale(orderItem.Specification, orderItem.Count);

                        if (!string.IsNullOrEmpty(orderItem.Specification.Product.MasterQrcode))
                        {
                            //Send masterQrcode
                            AsyncHelper.RunSync(async () =>
                            {
                                string accessToken = await WechatCommonManager.GetAccessTokenAsync(order.TenantId);
                                string openid = WechatUserManager.GetOpenid(order.GetUserIdentifier());

                                if (!string.IsNullOrEmpty(openid))
                                {
                                    CustomerServiceMessageHelper.SendImage(accessToken, openid, orderItem.Specification.Product.MasterQrcode);
                                }
                            });
                        }
                    }
                }
            }
        }
    }
}
