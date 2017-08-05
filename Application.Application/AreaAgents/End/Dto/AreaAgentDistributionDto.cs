using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.AreaAgents.End.Dto
{
    [AutoMap(typeof(AreaAgentDistribution))]
    public class AreaAgentDistributionDto : EntityDto
    {
        public int AreaAgentId { get; set; }

        [Required]
        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
