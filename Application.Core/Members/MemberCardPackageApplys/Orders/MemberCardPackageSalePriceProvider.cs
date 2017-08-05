using Application.Orders.SalePriceProviders;
using Infrastructure.Dependency;

namespace Application.Members.MemberCardPackageApplys.Orders
{
    public class MemberCardPackageSalePriceProvider : ISalePriceProvider<MemberCardPackageBoughtContext>, ISingletonDependency 
    {
        public MemberCardPackageBoughtContext Caculate(MemberCardPackageBoughtContext boughtContext)
        {
            boughtContext.Money = boughtContext.MemberCardPackage.Price;
            return boughtContext;
        }
    }
}
