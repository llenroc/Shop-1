using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Orders.Fronts.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.ChannelAgencyApplys.Dto
{
    [AutoMapFrom(typeof(ChannelAgencyApplyOrder))]
    public class ChannelAgencyApplyOrderDto : OrderDto
    {
        public bool HasProcessChannelAgencyApply { get; set; }
    }
}
