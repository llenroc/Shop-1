using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.ShopCarts.Fronts.Dto
{
    [AutoMap(typeof(ShopCart))]
    public class ShopCartDto:EntityDto
    {
        public long UserId { get; set; }

        public List<ShopCartItemDto> ShopCartItems { get; set; }
    }
}
