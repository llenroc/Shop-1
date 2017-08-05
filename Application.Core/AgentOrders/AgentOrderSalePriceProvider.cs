using Application.AreaAgents;
using Application.Orders.SalePriceProviders;
using Application.Products.Orders;
using Infrastructure.Dependency;

namespace Application.AgentOrders
{
    public class AgentOrderSalePriceProvider : ISalePriceProvider<AgentOrderBoughtContext>, ISingletonDependency
    {
        public AgentOrderBoughtContext Caculate(AgentOrderBoughtContext boughtContext)
        {
            if (boughtContext.ChannelAgency != null&&boughtContext.ChannelAgency.ChannelAgent.Discount>0&& boughtContext.ChannelAgency.ChannelAgent.Discount<boughtContext.Discount)
            {
                boughtContext.Discount = boughtContext.ChannelAgency.ChannelAgent.Discount;
            }

            foreach(AreaAgency areaAgency in boughtContext.AreaAgencys)
            {
                if (areaAgency.AreaAgent.Discount > 0 && areaAgency.AreaAgent.Discount < boughtContext.Discount)
                {
                    boughtContext.Discount = areaAgency.AreaAgent.Discount;
                }
            }

            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtItem.Price = boughtItem.Specification.Price*(decimal)boughtContext.Discount;
                boughtItem.Money = boughtItem.Price * boughtItem.Count;
                boughtContext.Money += boughtItem.Money;
            }
            return boughtContext;
        }
    }
}
