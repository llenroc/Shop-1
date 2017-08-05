using Application.Channel.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.Channel.Front
{
    public interface IChannelAgencyApplyForFrontAppService: IApplicationService
    {
        ChannelAgencyApplyDto Get(IdInput input);

        void Cancel(IdInput input);
    }
}
