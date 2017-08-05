using Application.AreaAgents.AreaAgencyApplys.Orders;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.AreaAgencyApplys.Dto
{
    [AutoMapTo(typeof(AreaAgencyApplyBoughtContext))]
    public class OrderConfirmInput
    {
        public int AreaAgentId { get; set; }

        public int[] AddressIds { get; set; }
    }
}
