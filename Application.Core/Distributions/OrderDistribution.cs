using Application.Authorization.Users;
using Application.Products.Orders.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;

namespace Application.Distributions
{
    public class OrderDistribution :AuditedEntity
    {
        [Required]
        public int OrderId { get; set; }

        public virtual ProductOrder Order { get; set; }

        [Required]
        public decimal OrderMoney { get; set; }

        [Required]
        public decimal Money { get; set; }

        [Required]
        public int OrderItemId{get;set;}

        [Required]
        public long UserId { get; set; }

        public virtual User User { get; set; }

        [Required]
        public int DistributionId { get; set; }

        public virtual Distribution Distribution { get; set; }
    }
}
