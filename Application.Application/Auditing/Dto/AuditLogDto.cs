using Application.Authorization.End.Users.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Auditing;
using Infrastructure.AutoMapper;
using System;

namespace Application.Auditing.Dto
{
    [AutoMapFrom(typeof(AuditLog))]
    public class AuditLogDto : EntityDto<long>
    {
        public int? TenantId { get; set; }

        public long? UserId { get; set; }

        public string ServiceName { get; set; }

        public string MethodName { get; set; }

        public string Parameters { get; set; }

        public DateTime ExecutionTime { get; set; }

        public int ExecutionDuration { get; set; }

        public string ClientIpAddress { get; set; }

        public string ClientName { get; set; }

        public string BrowserInfo { get; set; }

        public string Exception { get; set; }

        public long? ImpersonatorUserId { get; set; }

        public int? ImpersonatorTenantId { get; set; }

        public string CustomData { get; set; }

        //[NotMapped]
        public UserListDto User { get; set; }
    }
}