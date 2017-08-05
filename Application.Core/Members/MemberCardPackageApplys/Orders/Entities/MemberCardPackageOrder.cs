using Application.Orders.Entities;

namespace Application.Members.MemberCardPackageApplys.Orders.Entities
{
    public class MemberCardPackageOrder:Order
    {
        public virtual MemberCardPackage MemberCardPackage { get; set; }

        public bool HasProcessMemberCardPackage { get; set; } = false;

        public MemberCardPackageOrder()
        {
            HasProcessMemberCardPackage = false;
        }
    }
}
