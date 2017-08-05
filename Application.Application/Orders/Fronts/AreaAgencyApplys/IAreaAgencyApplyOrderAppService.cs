using Application.Orders.Fronts.AreaAgencyApplys.Dto;
using Application.Regions.Fronts.Dto;
using Infrastructure.Application.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.AreaAgencyApplys
{
    public interface IAreaAgencyApplyOrderAppService:IApplicationService
    {
        OrderConfirmOutput ConfirmOrder(OrderConfirmInput input);

        Task<AreaAgencyApplyOrderDto> CreateOrder(AreaAgencyApplyOrderCreateInput input);

        List<AddressDto> GetAddresses(AddressGetAllInput input);
    }
}
