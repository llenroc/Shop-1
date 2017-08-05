using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Shops.ShopTemplates
{
    public class ShopTemplate : FullAuditedEntity, IMustHaveTenant
    {
        public int TenantId { get; set; }

        public bool IsDefault { get; set; }

        public string Name { get; set; }

        public string Template { get; set; }
    }
}
