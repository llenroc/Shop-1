using System.Collections.Generic;

namespace Application.Channel.End.Dto
{
    public class ChannelAgentForCreateOrEditOutput
    {
        public ChannelAgentForCreateOrEditDto ChannelAgent { get; set; }

        public List<ChannelAgentDistributionDto> ChannelAgentDistributions { get; set; }

        public List<ChannelAgentAssortmentDto> ChannelAgentAssortments { get; set; }
    }
}
