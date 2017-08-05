using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Orders.Fronts.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.AreaAgencyApplys.Dto
{
    [AutoMapFrom(typeof(AreaAgencyApplyOrder))]
    public class AreaAgencyApplyOrderDto : OrderDto
    {
    }
}
