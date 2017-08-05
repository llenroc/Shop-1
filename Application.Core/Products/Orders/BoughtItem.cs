using Application.Products.Orders.Entities;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Products.Orders
{
    [AutoMapTo(typeof(OrderItem))]
    public class BoughtItem
    {
        public long UserId { get; set; }

        public int ProductId { get; set; }

        public int SpecificationId { get; set; }

        public int? CartItemId { get; set; }

        [Range(1,int.MaxValue)]
        public int Count { get;set; }

        public decimal Price { get; set; }

        public decimal Money { get; set; }

        public virtual Specification Specification { get; set; }

        public long Discount { get; private set; } = 0;

        public bool IsGift { get; set; }

        /// <summary>
        /// 商品在单品优惠后的单价，如果没有优惠则为正常购买的单价
        /// </summary>
        public decimal DiscountedPrice
        {
            get { return Price * (1 - Discount); }
        }

        public decimal TotalDiscountedPrice
        {
            get { return DiscountedPrice * Count; }
        }
    }
}
