using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;

namespace Application.AreaAgents
{
    public class AreaAgentDistribution : Entity
    {
        public int AreaAgentId { get; set; }

        [Required]
        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
