using Application.Orders.Fronts.Products.Dto;
using Application.Products.Fronts.Dto;
using Application.Products.Orders;
using Infrastructure.AutoMapper;

namespace Application.Orders.Fronts.ChannelAgencyApplys.Dto
{
    [AutoMapFrom(typeof(BoughtItem))]
    public class BoughtItemOutput
    {
        public int SpecificationId { get; set; }

        public int Count { get; set; }

        public ProductForOrderConfirmOutput Product { get; set; }

        public SpecificationForBoughtItemDto Specification { get; set; }
    }
}
