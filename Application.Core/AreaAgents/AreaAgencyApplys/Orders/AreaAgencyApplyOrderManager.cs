using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Authorization.Users;
using Application.Orders;
using Infrastructure.Domain.Repositories;

namespace Application.AreaAgents.AreaAgencyApplys.Orders
{
    public class AreaAgencyApplyOrderManager : OrderManager<AreaAgencyApplyOrder, AreaAgencyApplyBoughtContext>
    {
        private AreaAgencyApplyManager _areaAgencyApplyManager;

        public AreaAgencyApplyOrderManager(
            AreaAgencyApplyManager areaAgencyApplyManager,
            IRepository<AreaAgencyApplyOrder> orderRepository,
            IRepository<User, long> userRepository
            ) : base(orderRepository, userRepository)
        {
            _areaAgencyApplyManager = areaAgencyApplyManager;
        }

        protected override void PreCloseOrder(AreaAgencyApplyOrder order)
        {
            _areaAgencyApplyManager.DeleteAreaAgencyApplyByOrderId(order.Id);
        }

        public override AreaAgencyApplyOrder Receive(AreaAgencyApplyOrder order)
        {
            return order;
        }
    }
}
