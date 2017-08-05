using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Expresses.Dto
{
    [AutoMap(typeof(DeliveryArea))]
    public class DeliveryAreaDto:NullableIdDto
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
