using Application.Customers;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.CustomerInfos.Dto
{
    [AutoMap(typeof(CustomerInfo))]
    public class CustomerInfoDto : EntityDto
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string DetailAddress { get; set; }

        public int AddressId { get; set; }

        public AddressDto Address { get; set; }

        public string FullAddress { get; set; }

        public bool IsDefault { get; set; }
    }
}
