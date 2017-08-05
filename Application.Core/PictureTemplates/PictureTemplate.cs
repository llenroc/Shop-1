using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.PictureTemplates
{
    public class PictureTemplate: FullAuditedEntity, IMustHaveTenant
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Template { get; set; }

        public virtual List<TemplateParameter> Parameters { get; set; }

        public int TenantId { get; set; }
    }
}
