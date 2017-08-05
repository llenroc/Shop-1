using Application.Channel.ChannelAgents;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Channel.End.Dto
{
    [AutoMap(typeof(ChannelAgent))]
    public class ChannelAgentForCreateOrEditDto:NullableIdDto
    {
        public string Name { get; set; }

        public string NickName { get; set; }

        public decimal MinAgentOrderMoney { get; set; }

        public string AdWord { get; set; }

        public int? PictureTemplateId { get; set; }

        public string AssortmentDiscription { get; set; }

        public string Discription { get; set; }

        public string Discount { get; set; }

        public string Logo { get; set; }

        public int Level { get; set; }

        public decimal MinUpgradeSales { get; set; }

        public float RebateRatio { get; set; }

        public decimal Price { get; set; }

        public string MasterQrcode { get; set; }
    }
}
