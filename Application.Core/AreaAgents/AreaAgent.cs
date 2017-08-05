using Application.Agents;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.AreaAgents
{
    public class AreaAgent: AgentBase
    {
        public int Level { get; set; }

        public decimal Price { get; set; }

        public float NormalAddressRatio { get; set; }

        public float RebateRatio { get; set; }

        public float IndirectRebateRatio { get; set; }

        public float Discount { get; set; }

        public virtual ICollection<AreaAgentDistribution> AreaAgentDistributions { get; set; }

        public AreaAgent()
        {
            IndirectRebateRatio = 0;
            NormalAddressRatio = 1;
        }
    }
}
