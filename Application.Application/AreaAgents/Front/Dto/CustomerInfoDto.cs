using Application.Authorization.Front.Dto;
using Application.Customers;
using Infrastructure.AutoMapper;

namespace Application.AreaAgents.Front.Dto
{
    [AutoMap(typeof(CustomerInfo))]
    public class CustomerInfoDto 
    {
        public string DetailAddress { get; set; }

        public bool IsDefault { get; set; }

        public CommonUserForProfileDto CreatorUser { get; set; }

        public string FullAddress { get; set; }
    }
}
