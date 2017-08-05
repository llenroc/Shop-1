using Infrastructure.Application.DTO;

namespace Application.Channel.Front.Dto
{
    public class CustomerGetAllInput:PagedAndSortedResultRequestDto
    {
        public int? Depth { get; set; } = 1;

        public bool ShouldBePotential { get; set; } = false;
    }
}
