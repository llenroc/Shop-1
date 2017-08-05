using Application.Authorization.Users;
using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgents;
using Application.Channel.End.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System;
using System.Threading.Tasks;

namespace Application.Channel.End
{
    public class ChannelAgencyForEndAppService : 
        CrudAppService<ChannelAgency, ChannelAgencyDto>,
        IChannelAgencyForEndAppService
    {
        public IRepository<User,long > UserRepository { get; set; }
        public IRepository<ChannelAgent> ChannelAgentRepository { get; set; }

        public ChannelAgencyManager ChannelAgencyManager { get; set; }

        public ChannelAgencyForEndAppService(IRepository<ChannelAgency> respository) :base(respository)
        {

        }

        public async Task CreateChannelAgencyAsync(ChannelAgencyCreateInput input)
        {
            try
            {
                User user = UserRepository.Get(input.UserId);
                ChannelAgent channelAgent = ChannelAgentRepository.Get(input.ChannelAgentId);
                ChannelAgencyManager.CreateChannelAgency(channelAgent, user);
            }
            catch(Exception exception)
            {
                throw new UserFriendlyException(exception.Message);
            }
        }
    }
}
