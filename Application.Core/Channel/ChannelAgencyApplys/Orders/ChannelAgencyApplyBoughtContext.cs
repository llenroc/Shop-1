using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Channel.ChannelAgents;
using Application.Products.Orders;

namespace Application.Channel.ChannelAgencyApplys.Orders
{
    public class ChannelAgencyApplyBoughtContext :ProductBoughtContext<ChannelAgencyApplyOrder>
    {
        public int ChannelAgentId { get; set; }

        public ChannelAgent ChannelAgent { get; set; }

        public ChannelAgencyApply ChannelAgencyApply { get; set; }
    }
}
