using Application.Orders.Events;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Scores.EventHandlers
{
    public class OrderPayeddEventHandler : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public ScoreManager ScoreManager { get; set; }

        public void HandleEvent(OrderPayedEventData eventData)
        {
            if (eventData.Order.Score > 0)
            {
                ScoreManager.AddScore(eventData.Order.GetUserIdentifier(), eventData.Order.Score, "OrderScoreReward");
            }
        }
    }
}
