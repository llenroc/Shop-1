using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;
using Utility.Common;

namespace Application.VirtualProducts
{
    public enum VirtualCardStatus
    {
        Effective,
        Used,
        Overdue
    }

    public class VirtualCard : FullAuditedEntity, IMustHaveTenant
    {
        public int TenantId { get; set; }

        [Required]
        [MaxLength(32)]
        public string Name { get; set; }

        [Required]
        [MaxLength(32)]
        public string Value { get; set; }

        public int? ExpireDays { get; set; }

        public string Remark { get; set; }

        [MaxLength(32)]
        public string CardNumber { get; set; }

        [MaxLength(64)]
        public string CardPassword { get; set; }

        public VirtualCardStatus Status { get; set; }

        public string GetStatusText()
        {
            return Status.ToString();
        }

        public string Version { get; set; }

        public static string CreateVersion()
        {
            return TimeHelper.GetTimeStamp();
        }
    }
}
