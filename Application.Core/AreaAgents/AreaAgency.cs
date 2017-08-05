using Application.Agents;
using System.Collections.Generic;

namespace Application.AreaAgents
{
    public class AreaAgency :AgencyBase
    {
        public int AreaAgentId { get; set; }

        public virtual AreaAgent AreaAgent { get;set;}

        public virtual ICollection<AreaAgencyArea> AreaAgencyAreas { get; set; }

        public int Level { get; set; }

        public string GetAddresses()
        {
            string addresses = "";
            int index = 0;

            foreach(AreaAgencyArea areaAgencyArea in AreaAgencyAreas)
            {
                if (index > 0)
                {
                    addresses += "、";
                }
                addresses += areaAgencyArea.Address.GetFullAddress();
                index++;
            }
            return addresses;
        }
    }
}
