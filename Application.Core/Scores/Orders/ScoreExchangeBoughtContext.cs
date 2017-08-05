using Application.Products.Orders;
using Application.Scores.Orders.Entities;

namespace Application.Scores.Orders
{
    public class ScoreExchangeBoughtContext : ProductBoughtContext<ScoreExchangeOrder>
    {
        public int ExchangeScore { get; set; }
    }
}
