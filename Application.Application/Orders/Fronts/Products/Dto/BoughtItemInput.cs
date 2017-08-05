using Application.Products.Orders;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMapTo(typeof(BoughtItem))]
    public class BoughtItemInput
    {
        public int SpecificationId { get; set; }

        [Range(1,int.MaxValue)]
        public int Count { get; set; }

        public int? CartItemId{get;set;}
    }
}
