using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.AreaAgents.End.Dto
{
    [AutoMap(typeof(AreaAgent))]
    public class AreaAgentForCreateOrEditDto:NullableIdDto
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
    }
}
