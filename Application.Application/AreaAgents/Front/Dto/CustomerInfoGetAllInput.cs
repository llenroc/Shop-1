using Infrastructure.Application.DTO;

namespace Application.AreaAgents.Front.Dto
{
    public class CustomerInfoGetAllInput:PagedAndSortedResultRequestDto
    {
        public int AreaAgencyId { get; set; }
    }
}
