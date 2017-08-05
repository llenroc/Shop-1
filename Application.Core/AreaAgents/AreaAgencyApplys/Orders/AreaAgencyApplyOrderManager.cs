using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Authorization.Users;
using Application.Orders;
using Infrastructure.Domain.Repositories;

namespace Application.AreaAgents.AreaAgencyApplys.Orders
{
    public class AreaAgencyApplyOrderManager : OrderManager<AreaAgencyApplyOrder, AreaAgencyApplyBoughtContext>
    {
        public AreaAgencyApplyManager AreaAgencyApplyManager { get; set; }

        protected IRepository<AreaAgencyApply> AreaAgencyApplyRepository;

        public AreaAgencyApplyOrderManager(
            IRepository<AreaAgencyApplyOrder> orderRepository,
            IRepository<User, long> userRepository
            ) : base(orderRepository, userRepository)
        {
        }

        protected override void PreCloseOrder(AreaAgencyApplyOrder order)
        {
            AreaAgencyApplyManager.DeleteAreaAgencyApply(order.Id);
        }

        public override AreaAgencyApplyOrder Receive(AreaAgencyApplyOrder order)
        {
            return order;
        }
    }
}
