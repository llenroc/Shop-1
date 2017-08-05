using Infrastructure.Domain.Entities.Auditing;
using System.Collections.Generic;

namespace Application.Expresses
{
    public enum ValuationType
    {
        ByPiece,
        ByWeight
    }

    public enum FreightPlan
    {
        Unified,
        Custom
    }

    public class FreightTemplate : FullAuditedEntity
    {
        public string Name { get; set; }

        public ValuationType ValuationType { get; set; }

        public bool IsFreeShipping { get; set; }

        public FreightPlan FreightPlan { get; set; }

        public decimal UnifiedFreight { get; set; }

        public virtual ICollection<DeliveryArea> DeliveryAreas { get; set; }
    }
}
