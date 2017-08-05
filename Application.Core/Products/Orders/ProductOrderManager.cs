using Application.Authorization.Users;
using Application.Customers;
using Application.Expresses;
using Application.Orders;
using Application.Orders.Entities;
using Application.Orders.Events;
using Application.Orders.SalePriceProviders;
using Application.Products.Orders.Entities;
using Application.Products.Orders.Postages;
using Application.Products.Orders.Ship;
using Application.ShopCarts;
using Application.Shops;
using Infrastructure;
using Infrastructure.Configuration;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.UI;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Products.Orders
{
    public class ProductOrderManager : OrderManager<ProductOrder, ProductBoughtContext<ProductOrder>> 
    {
        protected IRepository<Product> ProductRepository;
        protected IRepository<Specification> SpecificationRepository;
        protected IRepository<CustomerInfo> CustomerInfoRespository;
        protected IRepository<ExpressCompany> ExpressCompanyRepository;

        public ProductManager ProductManager { get; set; }
        public ShopCartManager ShopCartManager { get; set; }
        public ISalePriceProvider<ProductBoughtContext<ProductOrder>> ProductSalePriceService { get; set; }
        public PostageService<ProductOrder> PostageService { get; set; }
        public ShipService ShipService { get; set; }

        public ProductOrderManager(
            IRepository<Product> productRepository,
            IRepository<Specification> specificationRepository,
            IRepository<ProductOrder> orderRepository,
            IRepository<ExpressCompany> expressCompanyRepository,
            IRepository<User, long> userRepository,
            IRepository<CustomerInfo> customerInfoRespository
            ) 
            :base(
                 orderRepository, 
                 userRepository)
        {
            ExpressCompanyRepository = expressCompanyRepository;
            ProductRepository = productRepository;
            SpecificationRepository = specificationRepository;
            CustomerInfoRespository = customerInfoRespository;
        }

        public async Task<bool> CheckBuyPermissionAsync()
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


        protected override void PreCloseOrder(ProductOrder order)
        {
            DecreaseStockWhen DecreaseStockWhen = (DecreaseStockWhen)(Enum.Parse(typeof(DecreaseStockWhen),
                SettingManager.GetSettingValueForTenant(ShopSettings.General.DecreaseStockWhen, order.TenantId)));

            //Increase stock
            if (DecreaseStockWhen == DecreaseStockWhen.Create)
            {
                foreach (OrderItem orderItem in order.OrderItems)
                {
                    orderItem.Specification.Stock += orderItem.Count;
                }
            }
        }

        public override void Ship(string orderNumber, string expressCompanyName, string trackingNumber)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant, DataFilters.MayHaveTenant))
            {
                if (String.IsNullOrEmpty(orderNumber) || String.IsNullOrEmpty(expressCompanyName) || String.IsNullOrEmpty(trackingNumber))
                {
                    return;
                }
                ProductOrder order = OrderRepository.GetAll().Where(model => model.Number == orderNumber).FirstOrDefault();

                if (order == null)
                {
                    return;
                }
                ExpressCompany expressCompany = ExpressCompanyRepository.GetAll().Where(model => model.Name == expressCompanyName).FirstOrDefault();

                if (expressCompany == null)
                {
                    return;
                }
                Ship(order, false, new ExpressInfo(expressCompany.Id, trackingNumber));
            }
        }

        public ProductOrder Ship(ProductOrder order, bool autoShip = false, ExpressInfo expressInfo = null)
        {
            if (!order.IsNeedShip)
            {
                throw new InfrastructureException(L("NoNeedShip"));
            }

            if (order.ShipStatus != ShipStatus.UnShip)
            {
                throw new InfrastructureException(L("OrderHasShiped"));
            }
            ShipService.Ship(order, autoShip, expressInfo);

            if (expressInfo != null)
            {
                order.ExpressCompanyId = expressInfo.ExpressCompanyId;
                order.TrackingNumber = expressInfo.TrackingNumber;
            }
            OrderRepository.Update(order as ProductOrder);
            CurrentUnitOfWork.SaveChanges();
            return order;
        }

        public bool CheckShipProgressAndCompleteShip(ProductOrder order, ExpressInfo expreeInfo = null)
        {
            if (order.OrderItems.Count > 0)
            {
                foreach (OrderItem orderItem in order.OrderItems)
                {
                    if (orderItem.ShipStatus == ShipStatus.UnShip)
                    {
                        return false;
                    }
                }
            }
            CompleteShip(order, expreeInfo);
            return true;
        }

        public override ProductOrder Receive(ProductOrder order)
        {
            order.ShipStatus = ShipStatus.Received;
            order.OrderStatus = OrderStatus.Received;
            OrderRepository.Update(order);
            EventBus.Trigger(new OrderReceivedEventData(order));
            return order;
        }

        [UnitOfWork]
        public override ProductOrder CompleteShip(ProductOrder order, ExpressInfo expreeInfo = null)
        {
            order.ShipStatus = ShipStatus.Shipping;
            order.OrderStatus = OrderStatus.Shiped;
            GetAutoReceiveLimit(order);
            CurrentUnitOfWork.SaveChanges();
            EventBus.Trigger(new OrderShipedEventData(order, expreeInfo));
            return order;
        }

        public virtual DateTime GetAutoReceiveLimit(ProductOrder order)
        {
            int autoReceiveLimit = SettingManager.GetSettingValueForTenant<int>(ShopSettings.Order.AutoReceiveLimit, InfrastructureSession.TenantId.Value);
            DateTime autoReceiveLimitDateTime = DateTime.Now.AddSeconds(autoReceiveLimit);
            order.AutoReceiveLimit = autoReceiveLimitDateTime;
            return autoReceiveLimitDateTime;
        }
    }
}
