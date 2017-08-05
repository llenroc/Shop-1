using Application.Channel.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.Channel.End
{
    public interface IChannelAgentForEndAppService: ICrudAppService<ChannelAgentDto>
    {
        ChannelAgentForCreateOrEditOutput GetChannelAgentForCreateOrEdit(NullableIdDto input);

        ChannelAgentForCreateOrEditDto CreateOrEdit(ChannelAgentCreateOrEditInput input);

        void RemoveDistribution(IdInput input);

        void RemoveChannelAgentDistribution(IdInput input);
    }
}
