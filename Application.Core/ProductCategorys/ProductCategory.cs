using Application.Products;
using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.Collections.Generic;

namespace Application.ProductCategorys
{
    public class ProductCategory : FullAuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }

        public string Name { get; set; }

        public string Icon { get; set; }

        public int? ParentId { get; set; }

        public virtual ProductCategory Parent { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
