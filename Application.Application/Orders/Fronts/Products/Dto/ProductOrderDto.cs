using Application.Orders.Fronts.Dto;
using Application.Products.Orders.Entities;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMap(typeof(ProductOrder))]
    public class ProductOrderDto : OrderDto
    {
        public List<OrderItemDto> OrderItems { get; set; }
    }
}
