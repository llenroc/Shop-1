using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.AreaAgents.End.Dto
{
    [AutoMapTo(typeof(AreaAgentDistribution))]
    public class AreaAgentDistributionCreateOrEditInput : NullableIdDto
    {
        public int? AreaAgentId { get; set; }

        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
