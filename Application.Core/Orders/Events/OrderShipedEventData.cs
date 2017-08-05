using Application.Orders.Entities;
using System;

namespace Application.Orders.Events
{
    [Serializable]
    public class OrderShipedEventData : OrderEventData
    {
        public ExpressInfo ExpressInfo { get; set; }

        public OrderShipedEventData(Order order, ExpressInfo expressInfo=null) :base(order)
        {
            ExpressInfo = expressInfo;
        }
    }
}
