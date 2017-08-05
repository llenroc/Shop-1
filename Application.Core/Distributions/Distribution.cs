using Application.Products;
using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;

namespace Application.Distributions
{
    public enum DistributionWhen
    {
        Payed,
        Receipt,
        Complete
    }

    public enum BuyWhen
    {
        NoLimit,
        First,
        Next
    }

    public class Distribution:Entity
    {
        public int ProductId { get; set; }

        public virtual Product Product { get; set; }

        public BuyWhen BuyWhen { get; set; }

        [Required]
        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
