using Application.Auditing.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Auditing;

namespace Application.Auditing
{
    public interface IAuditLogAppService : ICrudAppService<AuditLogDto, long, AuditLogGetAllInput>
    {
        PagedResultDto<AuditLogDto> GetAuditLogs(AuditLogGetAllInput input);

        AuditLogDto GetAuditLog(AuditLogDto input);
    }
}
