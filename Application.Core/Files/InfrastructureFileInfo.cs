using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;

namespace Application.Files
{
    public class InfrastructureFileInfo:AuditedEntity,IMayHaveTenant
    {
        public int? TenantId { get; set; }

        public string Name { get; set; }

        public int FileSize { get; set; }

        [MaxLength(50)]
        public string FileType { get; set; }

        public string Path { get; set; }
    }
}
