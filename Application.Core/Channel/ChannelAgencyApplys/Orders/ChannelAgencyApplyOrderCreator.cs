using Application.Authorization.Users;
using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Channel.ChannelAgents;
using Application.Customers;
using Application.Orders;
using Application.Orders.Entities;
using Application.Products;
using Application.Products.Orders;
using Application.Products.Orders.Entities;
using Application.Shops;
using Infrastructure.AutoMapper;
using Infrastructure.Configuration;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Channel.ChannelAgencyApplys.Orders
{
    public class ChannelAgencyApplyOrderCreator : OrderCreator<ChannelAgencyApplyOrder, ChannelAgencyApplyBoughtContext>
    {
        public ChannelAgencyManager ChannelAgencyManager { get; set; }
        public ChannelAgencyApplyManager ChannelAgencyApplyManager { get; set; }
        protected IRepository<ChannelAgencyApply> ChannelAgencyApplyRepository;
        public IRepository<CustomerInfo> CustomerInfoRespository;
        public ProductManager ProductManager { get; set; }
        protected IRepository<Specification> SpecificationRepository;

        public ChannelAgencyApplyOrderCreator(
            IRepository<ChannelAgencyApply> channelAgencyApplyRepository,
            IRepository<ChannelAgencyApplyOrder> orderRepository,
            IRepository<Specification> specificationRepository,
            IRepository<User, long> userRepository,
            IRepository<CustomerInfo> customerInfoRespository,
            ChannelAgencyApplySalePriceProvider salePriceProvider
            ) : base(orderRepository, userRepository, salePriceProvider)
        {
            SpecificationRepository = specificationRepository;
            ChannelAgencyApplyRepository = channelAgencyApplyRepository;
            CustomerInfoRespository = customerInfoRespository;
        }

        protected override string BuildTitle(ChannelAgencyApplyBoughtContext boughtContext)
        {
            return boughtContext.ChannelAgent.Name + L("Apply");
        }

        private void AssignBoughtItems(ChannelAgencyApplyBoughtContext boughtContext)
        {
            foreach (ChannelAgentAssortment channelAgentAssortment in boughtContext.ChannelAgent.ChannelAgentAssortments)
            {
                BoughtItem boughtItem = new BoughtItem()
                {
                    SpecificationId= channelAgentAssortment.SpecificationId,
                    ProductId=channelAgentAssortment.Specification.ProductId,
                    Count=channelAgentAssortment.Count,
                    IsGift=true
                };
                boughtItem.Specification = SpecificationRepository.Get(boughtItem.SpecificationId);
                boughtContext.BoughtItems.Add(boughtItem);
            }
        }

        protected override ChannelAgencyApplyBoughtContext PreProcessOrderData(ChannelAgencyApplyBoughtContext boughtContext)
        {
            AssignBoughtItems(boughtContext);

            if (boughtContext.CustomerInfoId.HasValue)
            {
                CustomerInfo customerInfo = CustomerInfoRespository.Get(boughtContext.CustomerInfoId.Value);
                OrderCustomerInfo orderCustomerInfo = new OrderCustomerInfo()
                {
                    FullName = customerInfo.FullName,
                    PhoneNumber = customerInfo.PhoneNumber,
                    DetailAddress=customerInfo.DetailAddress,
                    AddressId=customerInfo.AddressId
                };
                boughtContext.OrderCustomerInfo = orderCustomerInfo;
            }
            return base.PreProcessOrderData(boughtContext);
        }

        protected override void CustomerAssgin(ChannelAgencyApplyBoughtContext boughtContext)
        {
            boughtContext.Order.OrderItems = boughtContext.BoughtItems.MapTo<List<OrderItem>>();
            boughtContext.Order.OrderStatus = OrderStatus.UnPay;
            boughtContext.Order.IsNeedShip = true;
            boughtContext.Order.DisableProductRebate = true;
            boughtContext.Order.IsNeedLogistics = boughtContext.IsNeedLogistics;
            boughtContext.Order.NoteOfCustomer = boughtContext.NoteOfCustomer;
            boughtContext.Order.OrderCustomCustomerInfo = boughtContext.OrderCustomCustomerInfos;
            boughtContext.Order.HasProcessChannelAgencyApply = false;
            boughtContext.Order.OrderCustomerInfo = boughtContext.OrderCustomerInfo;
        }

        [UnitOfWork]
        public override async Task<ChannelAgencyApplyOrder> CreateOrder(ChannelAgencyApplyBoughtContext boughtContext)
        {
            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                ProductManager.CheckStock(boughtItem.Specification, boughtItem.Count);
                DecreaseStockWhen decreaseStockWhen = (DecreaseStockWhen)(Enum.Parse(typeof(DecreaseStockWhen),
                    SettingManager.GetSettingValueForTenant(ShopSettings.General.DecreaseStockWhen, InfrastructureSession.TenantId.Value)));

                if (decreaseStockWhen == DecreaseStockWhen.Create)
                {
                    ProductManager.DecreaseStock(boughtItem.Specification, boughtItem.Count);
                }
            }
            ChannelAgencyApplyOrder order = await base.CreateOrder(boughtContext);
            ChannelAgencyApplyManager.CreateChannelAgencyApply(boughtContext.ChannelAgent.Id, boughtContext.Order.UserId, boughtContext.Order.Id);
            return order;
        }
    }
}
