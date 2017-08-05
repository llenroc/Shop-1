using Infrastructure.Application.DTO;

namespace Application.VirtualProducts.VirtualCards.End.Dto
{
    public class VirtualCardGroupGetAllInput : PagedAndSortedResultRequestDto
    {
        public string Version { get; set; }

        public string Name { get; set; }

        public string Value { get; set; }
    }
}
