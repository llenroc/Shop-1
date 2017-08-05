using Application.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Orders.Admins.Dto
{
    [AutoMap(typeof(Order))]
    public class ChangePayMoneyOrderInput : EntityDto
    {
        [Required]
        public decimal PayMoney { get; set; }
    }
}
