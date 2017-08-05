using System.Collections.Generic;

namespace Application.Channel.End.Dto
{
    public class ChannelAgentCreateOrEditInput
    {
        public ChannelAgentForCreateOrEditDto ChannelAgent { get; set; }

        public List<ChannelAgentDistributionCreateOrEditInput> ChannelAgentDistributions { get; set; }

        public List<ChannelAgentAssortmentCreateOrEditInput> ChannelAgentAssortments{ get; set; }
    }
}
