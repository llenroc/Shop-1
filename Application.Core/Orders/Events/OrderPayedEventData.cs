using Application.Orders.Entities;
using System;

namespace Application.Orders.Events
{
    [Serializable]
    public class OrderPayedEventData : OrderEventData
    {

        public OrderPayedEventData(Order order):base(order)
        {
        }
    }

    public class OrderPayedEventData<T> : OrderEventData<T>
        where T:Order
    {

        public OrderPayedEventData(T order) : base(order)
        {
        }
    }
}
