using Application.AgentOrders.Entities;
using Application.Orders.Admins.ProductOrders.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.AgentOrders.Dto
{
    [AutoMap(typeof(AgentOrder))]
    public class AgentOrderDto: ProductOrderDto
    {
    }
}
