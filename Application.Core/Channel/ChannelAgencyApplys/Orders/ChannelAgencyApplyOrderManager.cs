using Application.Authorization.Users;
using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Orders;
using Infrastructure.Domain.Repositories;

namespace Application.Channel.ChannelAgencyApplys.Orders
{
    public class ChannelAgencyApplyOrderManager : OrderManager<ChannelAgencyApplyOrder, ChannelAgencyApplyBoughtContext>
    {
        public ChannelAgencyApplyManager ChannelAgencyApplyManager { get; set; }

        public ChannelAgencyApplyOrderManager(
            IRepository<ChannelAgencyApplyOrder> orderRepository,
            IRepository<User, long> userRepository
            ) : base(orderRepository, userRepository)
        {
        }

        protected override void PreCloseOrder(ChannelAgencyApplyOrder order)
        {
            ChannelAgencyApplyManager.DeleteChannelAgencyApply(order.Id);
        }
    }
}
