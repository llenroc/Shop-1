using Application.ShopCarts.Fronts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.ShopCarts.Fronts
{
    public interface IShopCartForFrontAppService : ICrudAppService<ShopCartDto>
    {
        ShopCartDto GetShopCart();

        ShopCartDto AddItem(ShopCartAddInput input);

        ShopCartItemDto SetCount(SetCountInput input);

        void RemoveItem(IdInput input);
    }
}
