using Application.IO;
using Application.Orders.Admins.Common;
using Application.Orders.Admins.Dto;
using Application.Orders.Admins.ProductOrders.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Admins.Orders
{
    public interface IProductOrderAdminAppService : ICrudAppService<
        ProductOrderDto,
        int,
        OrderGetAllInput,
        OrderCreateOrUpdateInput,
        OrderEditInput, 
        OrderGetInput, 
        OrderGetInput>
    {
        FileDto GetOrdersToExcel();

        void ChangePayMoney(ChangePayMoneyOrderInput input);

        void ChangeCustomerInfo(ChangeCustomerInfoInput input);

        ProductOrderForEditOutput GetOrderForEditOutput(OrderGetInput input);

        OrderForShipOutput GetOrderForShipOutput(OrderGetInput input);

        void Ship(ShipOrderInput input);

        void BathShipFromExcel(BatchShipInput input);

        Task SetAsPayed(OrderGetInput input);


        Task Refund(IdInput input);
    }
}
