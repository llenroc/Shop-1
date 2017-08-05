using Application.Members.MemberCardPackageApplys.Orders.Entities;
using Application.Orders.BoughtContexts;
using Infrastructure.Dependency;

namespace Application.Members.MemberCardPackageApplys.Orders
{
    public class MemberCardPackageBoughtContext : IBoughtContext<MemberCardPackageOrder>, ISingletonDependency
    {
        public MemberCardPackageOrder Order { get; set; }

        public MemberCardPackage MemberCardPackage { get; set; }

        public int Score { get; set; }

        public decimal Money { get; set; } = 0;


        public int ProductCount
        {
            get
            {
                return 0;
            }
        }
    }
}
