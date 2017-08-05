using Application.Authorization.Users;
using Application.Regions;
using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;

namespace Application.Customers
{
    public class CustomerInfo : FullAuditedEntity<int,User>,IMustHaveTenant
    {
        public int TenantId { get; set; }

        [Required]
        public string FullName { get; set; }

        [Required]
        public string PhoneNumber { get; set; }

        public string DetailAddress { get; set; }

        public int AddressId { get; set; }

        public virtual Address Address{get;set;}

        public bool IsDefault { get; set; }

        public string GetFullAddress()
        {
            if (Address == null)
            {
                return DetailAddress;
            }
            else
            {
                return Address.GetFullAddress() + DetailAddress;
            }
        }
    }
}
