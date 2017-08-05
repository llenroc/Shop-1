using Application.Expresses.Logistics.Dto;
using Application.Orders;
using Infrastructure.Application.Services;

namespace Application.Expresses.Logistics
{
    public interface ILogisticsAppService:IApplicationService
    {
        LogisticsInfoGetOutput GetExpresLogisticss(ExpressInfo expressInfo);
    }
}
