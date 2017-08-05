using Application.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.Dto
{
    [AutoMap(typeof(OrderCustomerInfo))]
    public class OrderCustomerInfoDto:EntityDto
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string DetailAddress { get; set; }

        public string FullAddress { get; set; }

        public int AddressId { get; set; }

        public AddressDto Address { get; set; }
    }
}
