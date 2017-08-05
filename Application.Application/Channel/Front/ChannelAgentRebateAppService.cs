using Application.Channel.ChannelAgents;
using Application.Channel.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Linq;

namespace Application.Channel.Front
{
    public class ChannelAgentRebateAppService:
        CrudAppService<ChannelAgentRebate, ChannelAgentRebateDto>,
        IChannelAgentRebateAppService
    {
        public ChannelAgentRebateAppService(IRepository<ChannelAgentRebate> respository) 
            :base(respository)
        {

        }

        protected override IQueryable<ChannelAgentRebate> CreateFilteredQuery(PagedAndSortedResultRequestDto input)
        {
            return Repository.GetAll().Where(model => model.UserId == InfrastructureSession.UserId.Value);
        }
    }
}