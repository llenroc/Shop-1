using Application.Products.Orders.Entities;

namespace Application.Channel.ChannelAgencyApplys.Orders.Entities
{
    public class ChannelAgencyApplyOrder : ProductOrder
    {
        public bool HasProcessChannelAgencyApply { get; set; } = false;
    }
}
