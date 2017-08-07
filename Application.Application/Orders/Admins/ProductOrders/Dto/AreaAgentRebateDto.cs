using Application.AreaAgents;
using Application.Group.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(AreaAgentRebate))]
    public class AreaAgentRebateDto
    {
        public int AreaAgencyId { get; set; }

        public AreaAgentOrderRebateType AreaAgentOrderRebateType { get; set; }

        public decimal Money { get; set; }

        public string Remark { get; set; }

        public bool IsIndirectRebate { get; set; }

        public CustomerDto User { get; set; }
    }
}
