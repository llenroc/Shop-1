using Infrastructure.Application.DTO;

namespace Application.Files.Dto
{
    public class FileGetAllInput:PagedAndSortedResultRequestDto
    {
        public string FileType { get; set; }
    }
}
