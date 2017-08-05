using Application.Channel.ChannelAgencyApplys.Orders;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.ChannelAgencyApplys.Dto
{
    [AutoMapTo(typeof(ChannelAgencyApplyBoughtContext))]
    public class OrderConfirmInput
    {
        public int ChannelAgentId { get; set; }

        public int? CustomerInfoId { get; set; }
    }
}
