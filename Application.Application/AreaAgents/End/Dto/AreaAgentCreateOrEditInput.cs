using System.Collections.Generic;

namespace Application.AreaAgents.End.Dto
{
    public class AreaAgentCreateOrEditInput
    {
        public AreaAgentForCreateOrEditDto AreaAgent { get; set; }

        public List<AreaAgentDistributionCreateOrEditInput> AreaAgentDistributions { get; set; }
    }
}
