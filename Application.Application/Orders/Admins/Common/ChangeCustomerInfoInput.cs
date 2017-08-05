using Application.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Orders.Admins.Common
{
    [AutoMapTo(typeof(OrderCustomerInfo))]
    public class ChangeCustomerInfoInput :EntityDto
    {
        [Required]
        public string FullName { get; set; }

        [Required]
        public string PhoneNumber { get; set; }

        [Required]
        public string DetailAddress { get; set; }

        [Required]
        public int AddressId { get; set; }
    }
}