using Application.Orders.Entities;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(OrderCustomerInfo))]
    public class OrderCustomerInfoForOrderForExportDto
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string FullAddress { get; set; }
    }
}
