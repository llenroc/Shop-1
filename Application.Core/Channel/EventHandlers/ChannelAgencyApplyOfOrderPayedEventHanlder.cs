using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgencyApplys.Orders;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Orders.Events;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Distributions.EventHandlers
{
    public class ChannelAgencyApplyOfOrderPayedEventHanlder : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public IRepository<ChannelAgencyApply> ChannelAgencyApplyRepository { get; set; }
        public IRepository<ChannelAgencyApplyOrder> ChannelAgencyApplyOrderRepository { get; set; }
        public ChannelAgencyApplyManager ChannelAgencyApplyManager { get; set; }
        public ChannelAgencyApplyOrderManager OrderManager { get; set; }

        [UnitOfWork]
        public void HandleEvent(OrderPayedEventData eventData)
        {
            if (eventData.Order is ChannelAgencyApplyOrder)
            {
                ChannelAgencyApplyOrder order = eventData.Order as ChannelAgencyApplyOrder;

                if (!order.HasProcessChannelAgencyApply)
                {
                    ChannelAgencyApply channelAgencyApply = ChannelAgencyApplyManager.GetChannelAgencyApplyFromOrder(order);
                    ChannelAgencyApplyManager.PassChannelAgencyApply(channelAgencyApply);
                    order.HasProcessChannelAgencyApply = true;
                    ChannelAgencyApplyOrderRepository.Update(order);

                    OrderManager.CompleteOrder(order);
                }
            }
        }
    }
}
