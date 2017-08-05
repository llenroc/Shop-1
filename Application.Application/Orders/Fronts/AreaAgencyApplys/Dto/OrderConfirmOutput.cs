using Application.AreaAgents.AreaAgencyApplys.Orders;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.AreaAgencyApplys.Dto
{
    [AutoMapFrom(typeof(AreaAgencyApplyBoughtContext))]
    public class OrderConfirmOutput
    {
        public decimal Money { get; set; }

        public int NormalAddressCount { get; set; }

        public int DevelopedAddressCount { get; set; }
    }
}
