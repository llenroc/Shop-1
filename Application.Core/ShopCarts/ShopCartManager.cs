using Application.Products;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.Services;
using Infrastructure.Runtime.Session;
using Infrastructure.UI;
using System.Linq;

namespace Application.ShopCarts
{
    public class ShopCartManager:DomainService
    {
        private IRepository<ShopCart> ShopCartRepository;
        private IRepository<Specification> SpecificationRepository;
        private IRepository<ShopCartItem> ShopCartItemRepository;

        public IInfrastructureSession Session { get; set; }

        public ShopCartManager(
            IRepository<ShopCart> shopCartRepository,
            IRepository<Specification> specificationRepository,
            IRepository<ShopCartItem> shopCartItemRepository)
        {
            SpecificationRepository = specificationRepository;
            ShopCartRepository = shopCartRepository;
            ShopCartItemRepository = shopCartItemRepository;
        }

        private ShopCart CreateShopCart(long userId)
        {
            ShopCart shopCart = new ShopCart()
            {
                UserId = userId
            };
            ShopCartRepository.Insert(shopCart);
            CurrentUnitOfWork.SaveChanges();
            return shopCart;
        }

        public ShopCart GetShopCart(long userId)
        {
            ShopCart shopCart= ShopCartRepository.GetAll().Where(model => model.UserId == userId).FirstOrDefault();

            if (shopCart==null)
            {
                shopCart = CreateShopCart(userId); 
            }
            return shopCart;
        }

        public ShopCart AddItem(ShopCartItem shopCartItem)
        {
            var specification = SpecificationRepository.Get(shopCartItem.SpecificationId);

            if (specification.Product.Type == ProductType.Virtual)
            {
                throw new UserFriendlyException(L("VirtualProductCannotAddToShopCart"));
            }
            ShopCart shopCart = GetShopCart(Session.UserId.Value);
            ShopCartItem shopCartItemForCheck = ShopCartItemRepository.GetAll().Where(model => model.ShopCartId == shopCart.Id && model.SpecificationId == shopCartItem.SpecificationId).FirstOrDefault();

            if (shopCartItemForCheck != null)
            {
                shopCartItemForCheck.Count += shopCartItem.Count;
            }
            else
            {
                shopCartItem.ShopCartId = shopCart.Id;
                shopCart.ShopCartItems.Add(shopCartItem);
            }
            CurrentUnitOfWork.SaveChanges();
            return shopCart;
        }

        public void RemoveItem(int id)
        {
            ShopCartItemRepository.Delete(id);
        }

        public ShopCartItem SetCount(int shopCartItemId,int count)
        {
            ShopCartItem shopCartItem = ShopCartItemRepository.Get(shopCartItemId);
            shopCartItem.Count = count;
            return shopCartItem;
        }
    }
}
