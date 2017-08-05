using Application.Orders.Entities;
using System;

namespace Application.Orders.Events
{
    [Serializable]
    public class OrderCreatedEventData : OrderEventData
    {
        public int ProductCount { get; set; }

        public OrderCreatedEventData(Order order,int productCount) :base(order)
        {
            ProductCount = productCount;
        }
    }
}
