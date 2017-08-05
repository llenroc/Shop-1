using Application.Regions;
using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Shops
{
    public enum ReduceStockType
    {
        WhenCreateOrder,
        WhenPay
    }

    public class Shop:FullAuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }
        public long UserId { get; set; }
        public string Name { get; set; }
        public string Logo { get; set; }
        public ReduceStockType ReduceStockType { get; set; }
        public virtual Address Address { get; set; }

        public string GetShopUrl()
        {
            return "";
        }
    }
}
