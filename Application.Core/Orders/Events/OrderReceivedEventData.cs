using Application.Products.Orders.Entities;
using System;

namespace Application.Orders.Events
{
    [Serializable]
    public class OrderReceivedEventData : OrderEventData
    {
        public OrderReceivedEventData(ProductOrder order):base(order)
        {
        }
    }
}
