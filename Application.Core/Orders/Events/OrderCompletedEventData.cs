using Application.Orders.Entities;
using System;

namespace Application.Orders.Events
{
    [Serializable]
    public class OrderCompletedEventData : OrderEventData
    {

        public OrderCompletedEventData(Order order) :base(order)
        {
        }
    }
}
