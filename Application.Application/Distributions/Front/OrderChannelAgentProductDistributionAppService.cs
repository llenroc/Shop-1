using Application.Distributions;
using Application.Distributions.Front.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Linq;
using Infrastructure.Application.DTO;

namespace Application.OrderDistributions.Front
{
    public class OrderChannelAgentProductDistributionAppService : 
        CrudAppService<OrderChannelAgentProductDistribution, OrderChannelAgentProductDistributionDto>, 
        IOrderChannelAgentProductDistributionAppService
    {
        public OrderChannelAgentProductDistributionAppService(IRepository<OrderChannelAgentProductDistribution> respository) :base(respository)
        {

        }

        protected override IQueryable<OrderChannelAgentProductDistribution> CreateFilteredQuery(PagedAndSortedResultRequestDto input)
        {
            return Repository.GetAll().Where(model => model.UserId == InfrastructureSession.UserId.Value);
        }
    }
}
