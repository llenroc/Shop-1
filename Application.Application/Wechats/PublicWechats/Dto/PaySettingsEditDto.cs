using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.PublicWechats.Dto
{
    public class PaySettingsEditDto
    {
        public string MchId { get; set; }

        public string Key { get; set; }

        public string SslcertPath { get; set; }
    }
}
