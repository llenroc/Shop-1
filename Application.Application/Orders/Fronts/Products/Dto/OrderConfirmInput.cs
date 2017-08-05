using Application.AgentOrders;
using Application.Products.Orders;
using Application.Scores.Orders;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMapTo(typeof(ProductBoughtContext),typeof(AgentOrderBoughtContext), typeof(ScoreExchangeBoughtContext))]
    public class OrderConfirmInput
    {
        public List<BoughtItemInput> BoughtItems { get; set; }

        public int? CustomerInfoId { get; set; }
    }
}
