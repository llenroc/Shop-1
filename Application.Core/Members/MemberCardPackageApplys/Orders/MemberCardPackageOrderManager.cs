using Application.Authorization.Users;
using Application.Members.MemberCardPackageApplys.Orders.Entities;
using Application.Orders;
using Application.Orders.Entities;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;

namespace Application.Members.MemberCardPackageApplys.Orders
{
    public class MemberCardPackageOrderManager : OrderManager<MemberCardPackageOrder, MemberCardPackageBoughtContext>
    {
        public MemberCardManager MemberCardManager { get; set; }

        public MemberCardPackageOrderManager(
            IRepository<MemberCardPackageOrder> orderRepository,
            IRepository<User, long> userRepository
            ) :base(orderRepository, userRepository)
        {

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

        protected override void PreCloseOrder(MemberCardPackageOrder order)
        {
        }
    }
}
