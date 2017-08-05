using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.ShopCarts.Fronts.Dto
{
    [AutoMap(typeof(ShopCartItem))]
    public class ShopCartItemDto : EntityDto
    {
        public int ShopCartId { get; set; }

        public int ProductId { get; set; }

        public int SpecificationId { get; set; }

        public SpecificationForShopCartItemDto Specification { get;set;}

        public int Count { get; set; }
    }
}
