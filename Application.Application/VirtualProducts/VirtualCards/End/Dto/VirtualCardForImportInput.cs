using System.ComponentModel.DataAnnotations;

namespace Application.VirtualProducts.VirtualCards.End.Dto
{
    public class VirtualCardForImportInput
    {
        [MaxLength(32)]
        public string CardNumber { get; set; }

        [MaxLength(64)]
        public string CardPassword { get; set; }
    }
}
