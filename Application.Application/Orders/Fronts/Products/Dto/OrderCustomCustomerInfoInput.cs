using Application.Orders.Entities;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMapTo(typeof(OrderCustomCustomerInfo))]
    public class OrderCustomCustomerInfoInput
    {
        public int CustomCustomerInfoId { get; set; }

        public string Value { get; set; }
    }
}
