using Application.Orders.Fronts.Dto;
using Application.Products.Orders.Entities;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMap(typeof(ProductOrder))]
    public class OrderForCommentDto: OrderDto
    {
        public List<OrderItemWithCommentDto> OrderItems { get; set; }
    }
}
