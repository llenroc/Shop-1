using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Products
{
    public class SpecificationPropertyValue : AuditedEntity
    {
        public int SpecificationId { get; set; }

        public int SpecificationPropertyId { get; set; }

        public virtual SpecificationProperty SpecificationProperty { get; set; }

        public string Value { get; set; }
    }

    public class Specification : FullAuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }

        public int ProductId { get; set; }

        [ForeignKey("ProductId")]
        public virtual Product Product { get;set;}

        public string CardValue { get; set; }

        public string Picture { get; set; }

        public int Stock { get; set; }

        public int Sale { get; set; }

        public decimal Price { get; set; }

        public ProductStatus Status { get; set; }

        public string Number { get; set; }

        public string Barcode { get; set; }

        public virtual ICollection<SpecificationPropertyValue> PropertyValues { get; set; }

        public string GetName()
        {
            string name = "";

            foreach (SpecificationPropertyValue specificationPropertyValue in PropertyValues)
            {
                name += " " + specificationPropertyValue.Value;
            }
            return name;
        }

        public string GetFullName()
        {
            string fullName = Product.Name;
            fullName += GetName();
            return fullName;
        }
    }
}
