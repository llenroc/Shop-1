using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Application.Channel.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Threading.Tasks;

namespace Application.Channel.End
{
    public class ChannelAgencyApplyForEndAppService : CrudAppService<ChannelAgencyApply, ChannelAgencyApplyDto>, 
        IChannelAgencyApplyForEndAppService
    {
        public ChannelAgencyApplyManager ChannelAgencyApplyManager { get; set; }

        public ChannelAgencyApplyForEndAppService(IRepository<ChannelAgencyApply> respository) :base(respository)
        {

        }

        public async Task PassChannelAgencyApply(IdInput input)
        {
            ChannelAgencyApply channelAgencyApply =await Repository.GetAsync(input.Id);
            ChannelAgencyApplyManager.PassChannelAgencyApply(channelAgencyApply);
        }
    }
}
