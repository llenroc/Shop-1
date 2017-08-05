using System.Collections.Generic;

namespace Application.AreaAgents.End.Dto
{
    public class AreaAgentForCreateOrEditOutput
    {
        public AreaAgentForCreateOrEditDto AreaAgent { get; set; }

        public List<AreaAgentDistributionDto> AreaAgentDistributions { get; set; }
    }
}
