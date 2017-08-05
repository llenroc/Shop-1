using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.PublicWechats.Dto
{
    public class SettingsEditDto
    {
        [Required]
        public GeneralSettingsDto General { get; set; }

        public PaySettingsEditDto Pay { get; set; }

        public TemplateMessageEditDto TemplateMessage { get; set; }
    }
}
