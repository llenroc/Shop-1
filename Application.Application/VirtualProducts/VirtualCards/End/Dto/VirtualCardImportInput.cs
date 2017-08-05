using System.ComponentModel.DataAnnotations;

namespace Application.VirtualProducts.VirtualCards.End.Dto
{
    public class VirtualCardImportInput
    {
        [Required]
        [MaxLength(32)]
        public string Name { get; set; }

        [Required]
        [MaxLength(32)]
        public string Value { get; set; }

        public int? ExpireDays { get; set; }

        public string Remark { get; set; }

        public string FilePath { get; set; }
    }
}
