using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;

namespace Application.Expresses
{
    public class ExpressCompany : FullAuditedEntity
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Icon { get; set; }

        [Required]
        public string Code { get; set; }
    }
}
