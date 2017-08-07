using Application.Products.Orders.Entities;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(ProductOrder))]
    public class ProductOrderDetailOutput: ProductOrderDto
    {
        public List<OrderChannelAgentProductDistributionDto> OrderChannelAgentProductDistributions { get; set; }

        public List<OrderDistributionDto> OrderDistributions { get; set; }

        public List<OrderAreaAgentDistributionDto> OrderAreaAgentDistributions { get; set; }

        public List<OrderChannelAgentDistributionDto> OrderChannelAgentDistributions { get; set; }

        public List<AreaAgentRebateDto> AreaAgentRebates { get; set; }

        public List<ChannelAgentRebateDto> ChannelAgentRebates { get; set; }
    }
}
