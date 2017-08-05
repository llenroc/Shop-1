using Application.Orders.Fronts.ChannelAgencyApplys.Dto;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.ChannelAgencyApplys
{
    public interface IChannelAgencyApplyOrderAppService:IApplicationService
    {
        OrderConfirmOutput ConfirmOrder(OrderConfirmInput input);

        Task<ChannelAgencyApplyOrderDto> CreateOrder(ChannelAgencyApplyOrderCreateInput input);
    }
}
