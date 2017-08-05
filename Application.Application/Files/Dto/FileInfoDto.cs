using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Files.Dto
{
    [AutoMap(typeof(InfrastructureFileInfo))]
    public class FileInfoDto:AuditedEntityDto
    {
        public string Name { get; set; }

        public string Path { get; set; }
    }
}
