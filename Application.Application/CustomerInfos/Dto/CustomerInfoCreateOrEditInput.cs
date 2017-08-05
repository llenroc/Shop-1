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
    [AutoMapTo(typeof(CustomerInfo))]
    public class CustomerInfoCreateOrEditInput : NullableIdDto
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string DetailAddress { get; set; }

        public int AddressId { get; set; }

        public bool IsDefault { get; set; }
    }
}
