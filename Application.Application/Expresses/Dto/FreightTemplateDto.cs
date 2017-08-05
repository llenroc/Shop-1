using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Expresses.Dto
{
    [AutoMap(typeof(FreightTemplate))]
    public class FreightTemplateDto:FullAuditedEntityDto
    {
        public string Name { get; set; }

        public ValuationType ValuationType { get; set; }

        public bool IsFreeShipping { get; set; }

        public FreightPlan FreightPlan { get; set; }

        public decimal UnifiedFreight { get; set; }

        public List<DeliveryAreaDto> DeliveryAreas { get; set; }
    }
}
