using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Configuration.Host.Dto
{
    public class HostSettingsEditDto
    {
        [Required]
        public GeneralSettingsEditDto General { get; set; }

        [Required]
        public HostUserManagementSettingsEditDto UserManagement { get; set; }

        [Required]
        public EmailSettingsEditDto Email { get; set; }
    }
}
