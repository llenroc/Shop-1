using Application.AreaAgents.Front.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.AreaAgents.Front
{
    public class AreaAgentRebateForFrontAppService : CrudAppService<AreaAgentRebate, AreaAgentRebateDto>, 
        IAreaAgentRebateForFrontAppService
    {
        public AreaAgentRebateForFrontAppService(IRepository<AreaAgentRebate> respository):base(respository)
        {
        }
    }
}
