using Application.Products;
using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;

namespace Application.Distributions
{
    public class ChannelAgentProductDistribution : Entity
    {
        public int ProductId { get; set; }

        public virtual Product Product { get; set; }

        [Required]
        public int Level { get; set; }

        public int? MinChannelAgentLevel { get; set; }

        public int? MaxChannelAgentLevel { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
