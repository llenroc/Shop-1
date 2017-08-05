using Application.AreaAgents.Front.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.AreaAgents.Front
{
    public class AreaAgentForFrontAppService : CrudAppService<AreaAgent, AreaAgentDto>, IAreaAgentForFrontAppService
    {
        public AreaAgentForFrontAppService(IRepository<AreaAgent> respository) :base(respository)
        {

        }
    }
}
