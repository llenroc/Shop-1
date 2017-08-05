using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using Senparc.Weixin.MP;

namespace Application.Wechats.Qrcodes
{
    public class Qrcode:FullAuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }

        public int SceneId { get; set; }

        public string SceneStr { get; set; }

        public string Ticket { get; set; }

        public QrCode_ActionName Type { get; set; }

        public string Url { get; set; }

        public int ExpireSeconds { get; set; }

        public string Path { get; set; }

        public string Name { get; set; }

        public long UserId { get; set; }
    }
}
