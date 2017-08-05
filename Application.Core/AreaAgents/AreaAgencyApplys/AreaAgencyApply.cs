using Application.Agents;
using System.Collections.Generic;
using System.Linq;

namespace Application.AreaAgents.AreaAgencyApplys
{
    public class AreaAgencyApply : AgencyApplyBase
    {
        public int AreaAgentId { get; set; }

        public int OrderId { get; set; }

        public virtual AreaAgent AreaAgent { get; set; }

        public virtual ICollection<AreaAgencyApplyAddress> AreaAgencyApplyAddresses { get; set; }

        public int[] GetAddressIds()
        {
            return AreaAgencyApplyAddresses.Select(model => model.AddressId).ToArray();
        }
    }
}
