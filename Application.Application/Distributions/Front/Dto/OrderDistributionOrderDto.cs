using Application.Authorization.Front.Dto;
using Application.Orders.Entities;
using Infrastructure.AutoMapper;

namespace Application.Distributions.Front.Dto
{
    [AutoMapFrom(typeof(Order))]
    public class OrderDistributionOrderDto
    {
        public string Title { get; set; }

        public decimal Money { get; set; }

        public decimal PayMoney { get; set; }

        public CommonUserForProfileDto User { get; set; }
    }
}
