using Application.CustomerInfos;
using Infrastructure.Domain.Entities;

namespace Application.Orders.Entities
{
    public class OrderCustomCustomerInfo:Entity
    {
        public virtual CustomCustomerInfo CustomCustomerInfo { get; set; }

        public int CustomCustomerInfoId { get; set; }

        public string Value { get; set; }
    }
}
