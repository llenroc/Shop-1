using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.AreaAgents.End.Dto
{
    [AutoMap(typeof(AreaAgent))]
    public class AreaAgentDto:FullAuditedEntityDto
    {
        public int Level { get; set; }

        public string Name { get; set; }

        public decimal MinAgentOrderMoney { get; set; }

        public decimal Price { get; set; }

        public float NormalAddressRatio { get; set; }

        public int? PictureTemplateId { get; set; }

        public float RebateRatio { get; set; }

        public float IndirectRebateRatio { get; set; }

        public float Discount { get; set; }

        public List<AreaAgentDistributionDto> AreaAgentDistributions { get; set; }
    }
}
