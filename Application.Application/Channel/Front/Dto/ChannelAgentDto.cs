using Application.Channel.ChannelAgents;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Channel.Front.Dto
{
    [AutoMap(typeof(ChannelAgent))]
    public class ChannelAgentDto:FullAuditedEntityDto
    {
        public string Name { get; set; }

        public string NickName { get; set; }

        public string AdWord { get; set; }

        public string AssortmentDiscription { get; set; }

        public int PictureTemplateId { get; set; }

        public string Discription { get; set; }

        public float Discount { get; set; }

        public string Logo { get; set; }

        public int Level { get; set; }

        public decimal MinUpgradeSales { get; set; }

        public float RebateRatio { get; set; }

        public decimal Price { get; set; }

        public string MasterQrcode { get; set; }

        public List<ChannelAgentDistributionDto> ChannelAgentDistributions { get; set; }

        public List<ChannelAgentAssortmentDto> ChannelAgentAssortments { get; set; }
    }
}
