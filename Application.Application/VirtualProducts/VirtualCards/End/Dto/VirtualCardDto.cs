using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.VirtualProducts.VirtualCards.End.Dto
{
    [AutoMap(typeof(VirtualCard))]
    public class VirtualCardDto:AuditedEntityDto
    {
        [Required]
        [MaxLength(32)]
        public string Name { get; set; }

        [Required]
        [MaxLength(32)]
        public string Value { get; set; }

        public int? ExpireDays { get; set; }

        public string Remark { get; set; }

        [MaxLength(32)]
        public string CardNumber { get; set; }

        [MaxLength(64)]
        public string CardPassword { get; set; }

        public VirtualCardStatus Status { get; set; }

        public string StatusText { get; set; }

        public string Version { get; set; }
    }
}
