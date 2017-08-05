using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Orders.BoughtContexts;
using Infrastructure.Dependency;

namespace Application.AreaAgents.AreaAgencyApplys.Orders
{
    public class AreaAgencyApplyBoughtContext : IBoughtContext<AreaAgencyApplyOrder>, ISingletonDependency
    {
        public int AreaAgentId { get; set; }

        public AreaAgent AreaAgent { get; set; }

        public int[] AddressIds { get; set; }

        public int NormalAddressCount { get; set; }

        public int Score { get; set; }

        public int DevelopedAddressCount { get; set; }

        public AreaAgencyApply AreaAgencyApply { get; set; }

        public AreaAgencyApplyOrder Order { get; set; }

        public string FullName { get; set; }

        public string WechatName { get; set; }

        public string IdentityNumber { get; set; }

        public string PhoneNumber { get; set; }

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
