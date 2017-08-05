using Application.Channel.ChannelAgents;
using Application.Orders.Events;
using Infrastructure.Dependency;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Distributions.EventHandlers
{
    public class ChannelAgentRebateOfOrderPayedEventHanlder : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public ChannelAgentManager ChannelAgentManager { get; set; }

        [UnitOfWork]
        public void HandleEvent(OrderPayedEventData eventData)
        {
           
        }
    }
}
