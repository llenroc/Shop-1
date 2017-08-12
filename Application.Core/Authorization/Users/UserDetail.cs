using Infrastructure.Domain.Entities;

namespace Application.Authorization.Users
{
    public class UserDetail:Entity, IMustHaveTenant
    {
        public virtual User User { get; set; }

        public int TenantId { get; set; }

        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string WechatName { get; set; }

        public string IdentityNumber { get; set; }

        public string QrcodePath { get; set; }
    }
}
