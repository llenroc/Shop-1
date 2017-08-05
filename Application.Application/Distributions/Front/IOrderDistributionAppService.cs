using Application.Distributions.Front.Dto;
using Infrastructure.Application.Services;

namespace Application.OrderDistributions.Front
{
    public interface IOrderDistributionAppService : ICrudAppService<OrderDistributionDto>
    {
    }
}
