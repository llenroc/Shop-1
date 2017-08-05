using Application.Orders.Events;
using Application.Scores.Orders.Entities;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;
using Infrastructure.Runtime.Session;

namespace Application.Scores.Orders.EventHandlers
{
    public class ScoreExchangeOrderCreatedEventHandler:
        ApplicationDomainServiceBase, 
        IEventHandler<OrderCreatedEventData>, 
        ISingletonDependency 
    {
        public ScoreManager ScoreManager { get; set; }

        public void HandleEvent(OrderCreatedEventData eventData)
        {
            if(eventData.Order is ScoreExchangeOrder&& eventData.Order.PayMoney == 0)
            {
                ScoreExchangeOrder order = eventData.Order as ScoreExchangeOrder;
                ScoreManager.ConsumeScore(InfrastructureSession.ToUserIdentifier(), order.ExchangeScore, L("ScoreExchange"));
            }
        }
    }
}
