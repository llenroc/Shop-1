using Application.Authorization.Users;
using Application.Entities;
using Application.Expresses;
using Application.Products.Orders.Entities;
using Application.Wallets.Entities;
using Infrastructure;
using Infrastructure.Domain.Entities.Auditing;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Orders.Entities
{
    public enum OrderStatus
    {
        Declined,
        UnPay,
        UnShip,
        Shiped,
        Received,
        Commented,
        Completed,
        Refunded,
        Close,
    }

    public enum RefundStatus
    {
        ToRefund,
        Refunding,
        Refunded,
        Failed
    }

    public enum PaymentStatus
    {
        ToPay,
        Payed
    }

    public enum ShipStatus
    {
        UnShip,
        Shipping,
        Received
    }

    public class Order : FullAuditedEntity, IUserIdentifierEntity
    {
        public string GetExpressCompanyName()
        {
            if (ExpressCompany == null)
            {
                return null;
            }
            return ExpressCompany.Name;
        }

        public int TenantId { get; set; }

        [Required]
        [MaxLength(32)]
        [Index]
        public string Number { get; set; }

        public string ShopId { get; set; }

        [Required]
        public string Title { get; set; }

        [Index]
        public OrderStatus OrderStatus { get;set;}

        [Required]
        public decimal Money { get; set; }

        [Required]
        public decimal PayMoney { get; set; }

        public int Score { get; set; }

        [Required]
        [Index]
        public long UserId { get; set; }
        
        public virtual User User { get; set; }

        public PaymentStatus PaymentStatus { get; set; }

        public DateTime? AutoReceiveLimit { get; set; }

        public DateTime? PaymentDatetime { get; set; }

        public PayType PayType { get; set; }

        public RefundStatus RefundStatus { get; set; }

        public string NoteOfCustomer { get; set; }

        public string OutTradeNo { get; set; }

        public string PrepayId { get; set; }

        public DateTime? PrepayIdCreatedTime { get; set; }

        public ICollection<OrderCustomCustomerInfo> OrderCustomCustomerInfo { get; set; }

        public decimal Postage { get; set; }

        public ShipStatus ShipStatus { get; set; }

        public virtual OrderCustomerInfo OrderCustomerInfo { get; set; }

        public int? ExpressCompanyId { get; set; }

        public string TrackingNumber { get; set; }

        public virtual ExpressCompany ExpressCompany { get; set; }

        [Required]
        public bool IsNeedShip { get; set; }

        public bool IsNeedLogistics { get; set; }

        public virtual UserIdentifier GetUserIdentifier()
        {
            return new UserIdentifier(TenantId, UserId);
        }

        public string GetStatusText()
        {
            return Enum.GetName(typeof(OrderStatus), OrderStatus);  
        }
    }
}
