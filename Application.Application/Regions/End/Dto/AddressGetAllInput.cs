using Infrastructure.Application.DTO;

namespace Application.Regions.End.Dto
{
    public class AddressGetAllInput:PagedAndSortedResultRequestDto
    {
        public int? ParentId { get; set; }
    }
}
