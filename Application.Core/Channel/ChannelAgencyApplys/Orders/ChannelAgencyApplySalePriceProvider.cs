using Application.Orders.SalePriceProviders;
using Infrastructure.Dependency;

namespace Application.Channel.ChannelAgencyApplys.Orders
{
    public class ChannelAgencyApplySalePriceProvider : ISalePriceProvider<ChannelAgencyApplyBoughtContext>, ISingletonDependency
    {
        public ChannelAgencyApplyBoughtContext Caculate(ChannelAgencyApplyBoughtContext boughtContext)
        {
            boughtContext.Money = boughtContext.ChannelAgent.Price;
            return boughtContext;
        }
    }
}
