using Application.Products.Tenants.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Distributions.Front.Dto
{
    [AutoMap(typeof(OrderDistribution))]
    public class OrderDistributionDto:AuditedEntityDto
    {
        public int OrderId { get; set; }

        public OrderDistributionOrderDto Order { get; set; }

        public decimal OrderMoney { get; set; }

        public decimal Money { get; set; }

        public int OrderItemId { get; set; }

        public long UserId { get; set; }

        public int DistributionId { get; set; }

        public DistributionDto Distribution { get; set; }
    }
}
