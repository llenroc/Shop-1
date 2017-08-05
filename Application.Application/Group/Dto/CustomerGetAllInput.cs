using Infrastructure.Application.DTO;

namespace Application.Group.Dto
{
    public class CustomerGetAllInput:PagedAndSortedResultRequestDto
    {
        public int? Depth { get; set; } = 1;

        public bool ShouldBePotential { get; set; } = false;
    }
}
