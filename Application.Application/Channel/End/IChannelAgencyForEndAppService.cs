using Application.Channel.End.Dto;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Channel.End
{
    public interface IChannelAgencyForEndAppService : ICrudAppService<ChannelAgencyDto>
    {
        Task CreateChannelAgencyAsync(ChannelAgencyCreateInput input);
    }
}