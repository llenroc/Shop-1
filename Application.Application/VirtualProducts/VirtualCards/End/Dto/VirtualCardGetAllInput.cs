using Infrastructure.Application.DTO;

namespace Application.VirtualProducts.VirtualCards.End.Dto
{
    public class VirtualCardGetAllInput:PagedAndSortedResultRequestDto
    {
        public string Version { get; set; }

        public string Name { get; set; }

        public string Value { get; set; }

        public string CardNumber { get; set; }

        public string CardPassword { get; set; }

        public VirtualCardStatus? Status { get; set; }
    }
}
