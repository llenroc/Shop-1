using Infrastructure.AutoMapper;
using System.Collections.Generic;
using Infrastructure.Application.DTO;

namespace Application.Expresses.Dto
{
    [AutoMap(typeof(FreightTemplate))]
    public class FreightTemplateCreateOrEditDto:NullableIdDto
    {
        public string Name { get; set; }

        public ValuationType ValuationType { get; set; }

        public bool IsFreeShipping { get; set; }

        public FreightPlan FreightPlan { get; set; }

        public decimal UnifiedFreight { get; set; }

        public List<DeliveryAreaDto> DeliveryAreas { get; set; }
    }
}
