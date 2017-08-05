using Application.Channel.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Channel.End
{
    public interface IChannelAgencyApplyForEndAppService : ICrudAppService<ChannelAgencyApplyDto>
    {
        Task PassChannelAgencyApply(IdInput input);
    }
}