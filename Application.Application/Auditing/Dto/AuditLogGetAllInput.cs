using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;

namespace Application.Auditing.Dto
{
    public class AuditLogGetAllInput: PagedAndSortedResultRequestDto
    {
        public virtual int? TenantId { get; set; }

        public virtual long? UserId { get; set; }

        public virtual string ServiceName { get; set; }

        public virtual string MethodName { get; set; }

        public virtual DateTime? ExecutionTime { get; set; }

        public virtual int? ExecutionDuration { get; set; }

        public virtual string ClientIpAddress { get; set; }

        public virtual string ClientName { get; set; }

        public virtual string BrowserInfo { get; set; }

        public virtual string Exception { get; set; }

        public virtual long? ImpersonatorUserId { get; set; }

        public virtual int? ImpersonatorTenantId { get; set; }
    }
}
