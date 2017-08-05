using Application.Authorization.End.Users.Dto;
using Application.Orders.Admins.Dto;
using Application.Orders.Entities;
using Application.Products.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(ProductOrder))]
    public class ProductOrderDto : FullAuditedEntityDto
    {
        public string Number { get; set; }

        public string Title { get; set; }

        public decimal Money { get; set; }

        public decimal PayMoney { get; set; }

        public long UserId { get; set; }

        public string NoteOfCustomer { get; set; }

        public string StatusText { get; set; }

        public DateTime? AutoReceiveLimit { get; set; }

        public virtual UserListDto User { get; set; }

        public virtual OrderCustomerInfoDto OrderCustomerInfo { get; set; }

        public OrderStatus OrderStatus { get; set; }

        public PaymentStatus PaymentStatus { get; set; }

        public DateTime? PaymentDatetime { get; set; }

        public RefundStatus RefundStatus { get; set; }

        public bool IsNeedShip { get; set; }

        public bool IsNeedLogistics { get; set; }

        public ShipStatus ShipStatus { get; set; }

        public List<OrderItemDto> OrderItems { get; set; }

        public string ExpressCompanyName { get; set; }

        public string TrackingNumber { get; set; }
    }
}
