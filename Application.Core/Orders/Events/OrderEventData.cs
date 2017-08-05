using Application.Orders.Entities;
using Infrastructure.Event.Bus;
using System;

namespace Application.Orders.Events
{
    [Serializable]
    public class OrderEventData:OrderEventData<Order>
    {
        public OrderEventData(Order order):base(order)
        {
        }
    }

    [Serializable]
    public class OrderEventData<T> : EventData, IEventDataWithInheritableGenericArgument
        where T:Order
    {
        public T Order { get; private set; }

        public OrderEventData(T order)
        {
            Order = order;
        }

        public virtual object[] GetConstructorArgs()
        {
            return new object[] { Order };
        }
    }
}
