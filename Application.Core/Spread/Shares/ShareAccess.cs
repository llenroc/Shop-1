using Infrastructure.Domain.Entities.Auditing;

namespace Application.Spread.Shares
{
    public class ShareAccess: AuditedEntity
    {
        public int ShareId { get; set; }
    }
}
