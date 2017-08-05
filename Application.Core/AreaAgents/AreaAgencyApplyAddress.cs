using Application.Regions;
using Infrastructure.Domain.Entities;

namespace Application.AreaAgents.AreaAgencyApplys
{

    public class AreaAgencyApplyAddress : Entity, IMustHaveTenant
    {
        public int TenantId { get; set; }

        public int AddressId { get; set; }

        public virtual Address Address { get; set; }

        public virtual AreaAgencyApply AreaAgencyApply { get; set; }

        public int AreaAgencyApplyId { get; set; }
    }
}
