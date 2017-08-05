using Application.Channel.ChannelAgents;
using Application.Channel.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.Channel.Front
{
    public class ChannelAgentForFrontAppService : CrudAppService<ChannelAgent, ChannelAgentDto>, IChannelAgentForFrontAppService
    {
        public ChannelAgentForFrontAppService(IRepository<ChannelAgent> respository) :base(respository)
        {

        }

        public override ListResultDto<ChannelAgentDto> GetAll()
        {
            return base.GetAll();
        }
    }
}
