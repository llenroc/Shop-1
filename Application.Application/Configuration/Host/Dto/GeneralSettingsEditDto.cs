using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Configuration.Host.Dto
{
    public class GeneralSettingsEditDto
    {
        [MaxLength(128)]
        public string WebSiteRootAddress { get; set; }

        public string AppName { get; set; }

        public bool WebSiteStatus { get; set; }

        public string AppLogo { get; set; }

        public string AppTitleLogo { get; set; }

        public string Timezone { get; set; }

        /// <summary>
        /// This value is only used for comparing user's timezone to default timezone
        /// </summary>
        public string TimezoneForComparison { get; set; }
    }
}
