using Application.Customers;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.CustomerInfos.Dto
{
    [AutoMapFrom(typeof(CustomerInfo))]
    public class CustomerInfoCreateOrEditOutput : NullableIdDto
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string DetailAddress { get; set; }

        public int AddressId { get; set; }

        public virtual AddressDto Address { get; set; }

        public bool IsDefault { get; set; }
    }
}
