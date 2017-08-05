using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.AreaAgents
{
    public class AreaAgentCertificateTemplate:FullAuditedEntity
    {
        public string Template { get; set; }


    }
}
