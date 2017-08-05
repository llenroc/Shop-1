using Application.Members.MemberCardPackageApplys.Orders.Entities;
using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.Collections.Generic;

namespace Application.Members
{
    public class MemberCardPackage:FullAuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }

        public string Title { get; set; }

        public int MemberLevelId { get; set; }

        public virtual MemberLevel MemberLevel { get; set; }

        public int Expiry { get; set; }

        public int Price { get; set; }

        public virtual ICollection<MemberCardPackageOrder> Orders { get; set; }

        public string GetMemberLevelDisplayName()
        {
            return MemberLevel.DisplayName;
        }
    }
}
