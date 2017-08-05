using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;

namespace Application.Expresses
{
    public class DeliveryArea:Entity
    {
        public int FreightTemplateId { get; set; }

        public string Addresses { get; set; }

        [Required]
        public float FirstAmount { get; set; }

        [Required]
        public decimal FirstFee { get; set; }

        [Required]
        public float AdditionalAmount { get; set; }

        [Required]
        public decimal AdditionalFee { get; set; }
    }
}
