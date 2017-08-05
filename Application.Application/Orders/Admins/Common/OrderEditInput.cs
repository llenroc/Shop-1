using Application.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.Dto
{
    [AutoMapTo(typeof(Order))]
    public class OrderEditInput:EntityDto
    {
        public decimal PayMoney { get; set; }
    }
}
