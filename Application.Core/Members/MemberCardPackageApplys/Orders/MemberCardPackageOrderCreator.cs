using Application.Authorization.Users;
using Application.Members.MemberCardPackageApplys.Orders.Entities;
using Application.Orders.Entities;
using Application.Orders;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Threading.Tasks;

namespace Application.Members.MemberCardPackageApplys.Orders
{
    public class MemberCardPackageOrderCreator : OrderCreator<MemberCardPackageOrder, MemberCardPackageBoughtContext>
    {
        public MemberCardManager MemberCardManager { get; set; }

        public MemberCardPackageOrderCreator(
            IRepository<MemberCardPackageOrder> orderRepository,
            IRepository<User, long> userRepository,
            MemberCardPackageSalePriceProvider salePriceProvider
            ) :base(orderRepository, userRepository,salePriceProvider)
        {

        }

        protected override string BuildTitle(MemberCardPackageBoughtContext boughtContext)
        {
            return boughtContext.MemberCardPackage.Title;
        }

        protected override MemberCardPackageBoughtContext PreProcessOrderData(MemberCardPackageBoughtContext boughtContext)
        {
            return base.PreProcessOrderData(boughtContext);
        }

        protected override void CustomerAssgin(MemberCardPackageBoughtContext boughtContext)
        {
            boughtContext.Order.MemberCardPackage = boughtContext.MemberCardPackage;
        }

        [UnitOfWork]
        public override async Task<MemberCardPackageOrder> CreateOrder(MemberCardPackageBoughtContext boughtContext)
        {
            MemberCardManager.CheckUserMemberCard(boughtContext.MemberCardPackage.MemberLevel.Id, Session.UserId.Value);
            MemberCardPackageOrder order = await base.CreateOrder(boughtContext);
            return order;
        }

        public MemberCardPackage GetMemberCardPackage(Order order)
        {
            return GetMemberCardPackage(order.Id);
        }

        public MemberCardPackage GetMemberCardPackage(int orderId)
        {
            return OrderRepository.Get(orderId).MemberCardPackage;
        }

        [UnitOfWork]
        public void ProcessMemberCardPackage(int orderId)
        {
            MemberCardPackageOrder order=OrderRepository.Get(orderId);
            order.HasProcessMemberCardPackage = true;
            OrderRepository.Update(order);
        }
    }
}
