using Application.Orders.Fronts.Dto;
using Infrastructure.Application.Services;

namespace Application.Orders.Fronts.Common
{
    public interface IOrderAppService : ICrudAppService<
        OrderDto,
        int,
        OrderGetAllInput,
        OrderDto,
        OrderDto, 
        OrderGetInput, 
        OrderGetInput>
    {
        PayOutput GetPayOutput(PayInput input);
    }
}
