using Application.ShopCarts.Fronts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;

namespace Application.ShopCarts.Fronts
{
    public class ShopCartForFrontAppService:CrudAppService<ShopCart, ShopCartDto>
        ,IShopCartForFrontAppService
    {
        public ShopCartManager ShopCartManager { get; set; }
        private IRepository<ShopCartItem> ShopCartItemRepository;

        public ShopCartForFrontAppService(IRepository<ShopCart> repository, IRepository<ShopCartItem> shopCartItemRepository) :base(repository)
        {
            ShopCartItemRepository = shopCartItemRepository;
        }

        public ShopCartDto GetShopCart()
        {
            return ShopCartManager.GetShopCart(InfrastructureSession.UserId.Value).MapTo<ShopCartDto>();
        }

        public ShopCartDto AddItem(ShopCartAddInput input)
        {
            ShopCartItem shopCartItem = input.MapTo<ShopCartItem>();
            return ShopCartManager.AddItem(shopCartItem).MapTo<ShopCartDto>();
        }

        public void RemoveItem(IdInput input)
        {
            ShopCartItemRepository.Delete(input.Id);
        }

        public ShopCartItemDto SetCount(SetCountInput input)
        {
            return ShopCartManager.SetCount(input.Id, input.Count).MapTo<ShopCartItemDto>(); ;
        }
    }
}
