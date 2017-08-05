using Application.Agents;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Channel.ChannelAgents
{
    public class ChannelAgent: AgentBase
    {
        [Required]
        public string NickName { get; set; }

        [Required]
        public string AdWord { get; set; }

        public string AssortmentDiscription { get; set; }

        public string Discription { get; set; }

        public float Discount { get; set; }

        [Required]
        public string Logo { get; set; }

        public int Level { get; set; }

        public decimal MinUpgradeSales { get; set; }

        [Required]
        public float RebateRatio { get; set; }

        public decimal Price { get; set; }

        public string MasterQrcode { get; set; }

        public virtual ICollection<ChannelAgentDistribution> ChannelAgentDistributions { get; set; }

        public virtual ICollection<ChannelAgentAssortment> ChannelAgentAssortments { get; set; }
    }
}
