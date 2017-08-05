using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;

namespace Application.Members
{
    public class MemberLevel: AuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [MaxLength(20)]
        public string DisplayName { get; set; }

        public string Icon { get; set; }
    }
}
