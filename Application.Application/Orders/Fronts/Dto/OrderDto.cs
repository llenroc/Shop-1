using Application.Expresses.Dto;
using Application.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;

namespace Application.Orders.Fronts.Dto
{
    [AutoMap(typeof(Order))]
    public class OrderDto : FullAuditedEntityDto
    {
        public string Number { get; set; }

        public string Title { get; set; }

        public decimal Money { get; set; }

        public decimal PayMoney { get; set; }

        public OrderStatus OrderStatus { get; set; }

        public string StatusText { get; set; }

        public DateTime? AutoReceiveLimit { get; set; }

        public long UserId { get; set; }

        public int Score { get; set; }

        public string NoteOfCustomer { get; set; }

        public PaymentStatus PaymentStatus { get; set; }

        public DateTime? PaymentDatetime { get; set; }

        public RefundStatus RefundStatus { get; set; }

        public OrderCustomerInfoDto OrderCustomerInfo { get; set; }

        public bool IsNeedShip { get; set; }

        public bool IsNeedLogistics { get; set; }

        public ShipStatus ShipStatus { get; set; }

        public int? ExpressCompanyId { get; set; }

        public string TrackingNumber { get; set; }

        public ExpressCompanyDto ExpressCompany { get; set; }
    }
}
