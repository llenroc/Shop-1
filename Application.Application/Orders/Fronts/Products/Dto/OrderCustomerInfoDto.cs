﻿using Application.Orders.Entities;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMap(typeof(OrderCustomerInfo))]
    public class OrderCustomerInfoDto
    {
        public string FullName { get; set; }

        public string FullAddress { get; set; }

        public string PhoneNumber { get; set; }

        public int AddressId { get; set; }
    }
}
