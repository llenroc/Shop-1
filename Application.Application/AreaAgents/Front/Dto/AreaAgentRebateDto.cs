using Application.Authorization.Front.Dto;
using Application.Orders.Fronts.Products.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.AreaAgents.Front.Dto
{
    [AutoMap(typeof(AreaAgentRebate))]
    public class AreaAgentRebateDto:EntityDto
    {
        public int AreaAgentId { get; set; }

        public AreaAgentDto AreaAgent { get; set; }

        public AreaAgentOrderRebateType AreaAgentOrderRebateType { get; set; }

        public decimal Money { get; set; }

        public int OrderId { get; set; }

        public CommonProductOrderDto Order { get; set; }

        public long UserId { get; set; }

        public long BuyerUserId { get; set; }
    }
}
