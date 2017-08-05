using Application.AreaAgents;
using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Infrastructure;
using System.Collections.Generic;

namespace Application.AgentOrders
{
    public class AgentOrderManager:ApplicationDomainServiceBase
    {
        public AreaAgencyManager AreaAgencyManager { get; set; }
        public ChannelAgencyManager ChannelAgencyManager { get; set; }

        public decimal GetMinAgentOrderMoney(UserIdentifier userIdentifier)
        {
            decimal? money = null;

            List<AreaAgency> areaAgencys = AreaAgencyManager.GetAreaAgencysOfUser(userIdentifier.UserId);
            ChannelAgency channelAgency = ChannelAgencyManager.GetChannelAgencyOfUser(userIdentifier.UserId);

            foreach(AreaAgency areaAgency in areaAgencys)
            {
                if (areaAgency.AreaAgent.MinAgentOrderMoney > 0)
                {
                    if (!money.HasValue||(money.HasValue&& areaAgency.AreaAgent.MinAgentOrderMoney> money.Value))
                    {
                        money = areaAgency.AreaAgent.MinAgentOrderMoney;
                    }
                }
            }

            if (channelAgency != null)
            {
                if (channelAgency.ChannelAgent.MinAgentOrderMoney > 0)
                {
                    if (!money.HasValue || (money.HasValue&&channelAgency.ChannelAgent.MinAgentOrderMoney>money.Value))
                    {
                        money = channelAgency.ChannelAgent.MinAgentOrderMoney;
                    }
                }
            }
            money = money.HasValue ? money.Value : 0;
            return money.Value;
        }
    }
}
