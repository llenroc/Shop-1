using Application.Orders.Fronts.Products.Dto;
using Application.Scores.Orders.Entities;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.ScoreExchange.Dto
{
    [AutoMap(typeof(ScoreExchangeOrder))]
    public class ScoreExchangeOrderDto: ProductOrderDto
    {
        public int ExchangeScore { get; set; }
    }
}
