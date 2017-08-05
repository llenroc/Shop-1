using Application.Products.Orders.Entities;

namespace Application.Scores.Orders.Entities
{
    public class ScoreExchangeOrder : ProductOrder
    {
        public int ExchangeScore { get; set; }
    }
}
