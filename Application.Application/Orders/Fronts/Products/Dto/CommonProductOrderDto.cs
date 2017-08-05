using Application.Authorization.Front.Dto;
using Application.Orders.Entities;
using Application.Products.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMap(typeof(ProductOrder))]
    public class CommonProductOrderDto:FullAuditedEntityDto
    {
        public string Number { get; set; }

        public string Title { get; set; }

        public decimal Money { get; set; }

        public decimal PayMoney { get; set; }

        public string StatusText { get; set; }

        public long UserId { get; set; }

        public PaymentStatus PaymentStatus { get; set; }

        public DateTime? PaymentDatetime { get; set; }

        public RefundStatus RefundStatus { get; set; }

        public CommonUserForProfileDto User { get; set; }

        public List<OrderItemDto> OrderItems { get; set; }
    }
}
