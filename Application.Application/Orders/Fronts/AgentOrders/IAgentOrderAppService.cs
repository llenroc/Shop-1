using Application.Orders.Fronts.AgentOrders.Dto;
using Application.Orders.Fronts.Dto;
using Application.Orders.Fronts.Products.Dto;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.AgentOrders
{
    public interface IAgentOrderAppService : ICrudAppService<
        AgentOrderDto,
        int,
        OrderGetAllInput,
        AgentOrderDto,
        AgentOrderDto, 
        OrderGetInput, 
        OrderGetInput>
    {
        decimal GetMinAgentOrderMoney();

        AgentOrderConfirmOutput ConfirmOrder(OrderConfirmInput input);

        Task<AgentOrderDto> CreateOrder(OrderCreateInput input);
    }
}
