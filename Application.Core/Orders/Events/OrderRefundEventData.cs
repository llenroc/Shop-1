using Application.Orders.Entities;
using System;

namespace Application.Orders.Events
{
    [Serializable]
    public class OrderRefundEventData : OrderEventData
    {
        public OrderRefundEventData(Order order):base(order)
        {
        }
    }
}
