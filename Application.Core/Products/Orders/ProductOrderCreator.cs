using Application.Authorization.Users;
using Application.Customers;
using Application.Expresses;
using Application.Orders;
using Application.Orders.Entities;
using Application.Orders.SalePriceProviders;
using Application.Products.Orders.Entities;
using Application.Products.Orders.Postages;
using Application.Products.Orders.Ship;
using Application.ShopCarts;
using Application.Shops;
using Infrastructure.AutoMapper;
using Infrastructure.Configuration;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Products.Orders
{
    public class ProductOrderCreator : ProductOrderCreator<ProductOrder, ProductBoughtContext>
    {

        public ProductOrderCreator(
            IRepository<Product> productRepository,
            IRepository<Specification> specificationRepository,
            IRepository<ProductOrder> orderRepository,
            IRepository<ExpressCompany> expressCompanyRepository,
            IRepository<User, long> userRepository,
            IRepository<CustomerInfo> customerInfoRespository,
            ProductSalePriceProvider productSalePriceProvider
            )
            : base(
                 productRepository,
                 specificationRepository,
                 orderRepository,
                 expressCompanyRepository,
                 userRepository,
                 customerInfoRespository,
                 productSalePriceProvider
                 )
        {
        }
    }

    public class ProductOrderCreator<TProductOrder, TProductBoughtContext> :
        OrderCreator<TProductOrder, TProductBoughtContext> 
        where TProductOrder:ProductOrder,new()
        where TProductBoughtContext: ProductBoughtContext<TProductOrder>
    {
        protected IRepository<Product> ProductRepository;
        protected IRepository<Specification> SpecificationRepository;
        protected IRepository<CustomerInfo> CustomerInfoRespository;
        protected IRepository<ExpressCompany> ExpressCompanyRepository;

        public ProductManager ProductManager { get; set; }
        public ShopCartManager ShopCartManager { get; set; }
        public PostageService<TProductOrder> PostageService { get; set; }
        public ShipService ShipService { get; set; }

        public ProductOrderCreator(
            IRepository<Product> productRepository,
            IRepository<Specification> specificationRepository,
            IRepository<TProductOrder> orderRepository,
            IRepository<ExpressCompany> expressCompanyRepository,
            IRepository<User, long> userRepository,
            IRepository<CustomerInfo> customerInfoRespository,
            ISalePriceProvider<TProductBoughtContext> productSalePriceProvider
            ) 
            :base(
                 orderRepository, 
                 userRepository,  
                 productSalePriceProvider)
        {
            ExpressCompanyRepository = expressCompanyRepository;
            ProductRepository = productRepository;
            SpecificationRepository = specificationRepository;
            CustomerInfoRespository = customerInfoRespository;
        }

        public override async Task<bool> CheckBuyPermissionAsync()
        {
            bool ShouldBeSpreadForBuy = await SettingManager.GetSettingValueForTenantAsync<bool>(ShopSettings.Order.ShouldHasParentForBuy, InfrastructureSession.TenantId.Value);

            if (ShouldBeSpreadForBuy)
            {
                User user = UserRepository.Get(InfrastructureSession.UserId.Value);

                if (!user.ParentUserId.HasValue)
                {
                    throw new UserFriendlyException(L("YouHasNoParentForBuy"));
                }
            }
            return true;
        }

        protected virtual void ComputeChannelAgentRebate(TProductBoughtContext boughtContext)
        {
            decimal ChannelAgentRebate = 0;

            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                if (!boughtItem.IsGift)
                {
                    ChannelAgentRebate += boughtItem.Money;
                }
            }
            boughtContext.ChannelAgentRebate = ChannelAgentRebate;
        }

        protected override void PostCreate(TProductBoughtContext boughtContext)
        {
            base.PostCreate(boughtContext);
            ComputeChannelAgentRebate(boughtContext);
            boughtContext.Order.ChannelAgentRebate = boughtContext.ChannelAgentRebate;
        }

        protected override void CustomerAssgin(TProductBoughtContext boughtContext)
        {
            boughtContext.Order.OrderItems = boughtContext.BoughtItems.MapTo<List<OrderItem>>();
            boughtContext.Order.OrderStatus = OrderStatus.UnPay;
            boughtContext.Order.IsNeedShip = boughtContext.IsNeedShip;
            boughtContext.Order.IsNeedLogistics = boughtContext.IsNeedLogistics;
            boughtContext.Order.NoteOfCustomer = boughtContext.NoteOfCustomer;
            boughtContext.Order.OrderCustomCustomerInfo = boughtContext.OrderCustomCustomerInfos;
            boughtContext.Order.OrderCustomerInfo = boughtContext.OrderCustomerInfo;
            boughtContext.Order.AutoReceiveLimit = boughtContext.AutoReceiveLimit;
        }

        protected override TProductBoughtContext PreProcessOrderData(TProductBoughtContext boughtContext)
        {
            PostageService.ComputePostage(boughtContext);

            if (boughtContext.CustomerInfoId.HasValue)
            {
                CustomerInfo customerInfo = CustomerInfoRespository.Get(boughtContext.CustomerInfoId.Value);
                boughtContext.OrderCustomerInfo = new OrderCustomerInfo()
                {
                    FullName=customerInfo.FullName,
                    PhoneNumber=customerInfo.PhoneNumber,
                    DetailAddress=customerInfo.DetailAddress,
                    AddressId=customerInfo.AddressId
                };
            }
            return base.PreProcessOrderData(boughtContext);
        }

        protected override void CaculateScore(TProductBoughtContext boughtContext)
        {
            foreach(BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtContext.Score += boughtItem.Specification.Product.Score* boughtItem.Count;
            }
        }

        protected override TProductBoughtContext AssignMoney(TProductBoughtContext boughtContext)
        {
            boughtContext.Order.Money = boughtContext.Money;
            boughtContext.Order.PayMoney = boughtContext.Money + boughtContext.Postage;
            return boughtContext;
        }

        protected override string BuildTitle(TProductBoughtContext boughtContext)
        {
            string title = "";
            int i = 0;

            foreach (OrderItem orderItem in boughtContext.Order.OrderItems)
            {
                title += orderItem.Specification.Product.Name;

                foreach(SpecificationPropertyValue specificationPropertyValue in orderItem.Specification.PropertyValues)
                {

                    if (i > 0)
                    {
                        title += "&";
                    }
                    title += specificationPropertyValue.Value;
                }
                i++;
            }
            return title;
        }

        public override async Task<TProductOrder> CreateOrder(TProductBoughtContext boughtContext)
        {
            foreach(BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtItem.Specification = SpecificationRepository.Get(boughtItem.SpecificationId);
                boughtItem.ProductId = boughtItem.Specification.ProductId;
                ProductManager.CheckStock(boughtItem.Specification, boughtItem.Count);

                if (boughtItem.CartItemId.HasValue)
                {
                    ShopCartManager.RemoveItem(boughtItem.CartItemId.Value);
                }
                DecreaseStockWhen decreaseStockWhen = (DecreaseStockWhen)(Enum.Parse(typeof(DecreaseStockWhen),
                    SettingManager.GetSettingValueForTenant(ShopSettings.General.DecreaseStockWhen,InfrastructureSession.TenantId.Value)));

                if(decreaseStockWhen== DecreaseStockWhen.Create)
                {
                    ProductManager.DecreaseStock(boughtItem.Specification, boughtItem.Count);
                }
            }
            TProductOrder order =await base.CreateOrder(boughtContext);
            return order;
        }
    }
}
