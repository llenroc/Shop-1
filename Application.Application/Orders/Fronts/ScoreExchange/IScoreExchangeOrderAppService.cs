using Application.Orders.Fronts.Dto;
using Application.Orders.Fronts.Products.Dto;
using Application.Orders.Fronts.ScoreExchange.Dto;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.ScoreExchange
{
    public interface IScoreExchangeOrderAppService : ICrudAppService<
        ScoreExchangeOrderDto,
            int,
            OrderGetAllInput,
            ScoreExchangeOrderDto,
            ScoreExchangeOrderDto,
            OrderGetInput,
            OrderGetInput>
    {
        OrderConfirmOutput ConfirmOrder(OrderConfirmInput input);

        Task<ScoreExchangeOrderDto> CreateOrder(OrderCreateInput input);
    }
}
