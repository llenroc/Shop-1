using Application.Distributions;
using Application.Distributions.Front.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Linq;
using Infrastructure.Application.DTO;

namespace Application.OrderDistributions.Front
{
    public class OrderDistributionAppService : CrudAppService<OrderDistribution, OrderDistributionDto>, IOrderDistributionAppService
    {
        public OrderDistributionAppService(IRepository<OrderDistribution> respository) :base(respository)
        {

        }

        protected override IQueryable<OrderDistribution> CreateFilteredQuery(PagedAndSortedResultRequestDto input)
        {
            return Repository.GetAll().Where(model => model.UserId == InfrastructureSession.UserId.Value);
        }
    }
}
