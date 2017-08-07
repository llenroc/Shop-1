using Application.Distributions;
using Application.Group.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(OrderDistribution))]
    public class OrderDistributionDto
    {
        public decimal Money { get; set; }

        public CustomerDto User { get; set; }

        public DistributionDto Distribution { get; set; }
    }
}
