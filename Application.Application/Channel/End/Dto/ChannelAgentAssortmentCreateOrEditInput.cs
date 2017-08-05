using Application.Channel.ChannelAgents;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Channel.End.Dto
{
    [AutoMapTo(typeof(ChannelAgentAssortment))]
    public class ChannelAgentAssortmentCreateOrEditInput : NullableIdDto
    {
        public int? ChannelAgentId { get; set; }

        public int SpecificationId { get; set; }

        public int Count { get; set; }
    }
}
