using Application.AgentOrders;
using Application.AgentOrders.Entities;
using Application.AreaAgents;
using Application.Channel.ChananlAgencys;
using Application.CustomerInfos;
using Application.CustomerInfos.Dto;
using Application.Customers;
using Application.Orders.Fronts.AgentOrders.Dto;
using Application.Orders.Fronts.Dto;
using Application.Orders.Fronts.Products.Dto;
using Application.Products;
using Application.Products.Orders;
using Application.Products.Orders.Entities;
using Application.Products.Orders.Postages;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Threading.Tasks;
using Infrastructure.Runtime.Session;

namespace Application.Orders.Fronts.AgentOrders
{
    public class AgentOrderAppService : CrudAppService<
            AgentOrder,
            AgentOrderDto,
            int,
            OrderGetAllInput,
            AgentOrderDto,
            AgentOrderDto, OrderGetInput, OrderGetInput>
        , IAgentOrderAppService
    {
        protected IRepository<AgentOrder> OrderBaseRepository;
        protected IRepository<OrderItem> OrderItemRepository;
        protected IRepository<Product> ProductRepository;
        protected IRepository<Specification> SpecificationRepository;
        protected IRepository<CustomerInfo> CustomerInfoRepository;
        private AgentOrderCreator OrderCreator;
        public ProductSalePriceService ProductSalePriceService { get; set; }
        public PostageService PostageService { get; set; }
        public CustomerInfoManager CustomerInfoManager { get; set; }
        public AreaAgencyManager AreaAgencyManager { get; set; }
        public ChannelAgencyManager ChannelAgencyManager { get; set; }
        public AgentOrderManager AgentOrderManager { get; set; }

        public AgentOrderAppService(
            AgentOrderCreator orderCreator,
            IRepository<AgentOrder> repository,
            IRepository<AgentOrder> orderBaseRepository,
            IRepository<OrderItem> orderItemRepository,
            IRepository<Product> productRepository,
            IRepository<Specification> specificationRepository,
            IRepository<CustomerInfo> customerInfoRepository) : base(repository)
        {
            OrderCreator = orderCreator;
            OrderBaseRepository = orderBaseRepository;
            OrderItemRepository = orderItemRepository;
            ProductRepository = productRepository;
            SpecificationRepository = specificationRepository;
            CustomerInfoRepository = customerInfoRepository;
        }

        public decimal GetMinAgentOrderMoney()
        {
            return AgentOrderManager.GetMinAgentOrderMoney(InfrastructureSession.ToUserIdentifier());
        }

        public AgentOrderConfirmOutput ConfirmOrder(OrderConfirmInput input)
        {
            AgentOrderBoughtContext boughtContext = input.MapTo<AgentOrderBoughtContext>();
            boughtContext.AreaAgencys = AreaAgencyManager.GetAreaAgencysOfUser(InfrastructureSession.UserId.Value);
            boughtContext.ChannelAgency = ChannelAgencyManager.GetChannelAgencyOfUser(InfrastructureSession.UserId.Value);

            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtItem.UserId = InfrastructureSession.UserId.Value;
                boughtItem.Specification = SpecificationRepository.Get(boughtItem.SpecificationId);
            }
            OrderCreator.SalePriceProvider.Caculate(boughtContext);
            AgentOrderConfirmOutput orderConfirmOutput = boughtContext.MapTo<AgentOrderConfirmOutput>();
            orderConfirmOutput.CustomCustomerInfos = boughtContext.GetCustomCustomerInfos();

            if (input.CustomerInfoId.HasValue)
            {
                orderConfirmOutput.CustomerInfo = CustomerInfoRepository.Get(input.CustomerInfoId.Value).MapTo<CustomerInfoDto>();
            }
            else
            {
                orderConfirmOutput.CustomerInfo = CustomerInfoManager.GetDefaultCustomerInfo(InfrastructureSession.UserId.Value).MapTo<CustomerInfoDto>();
            }
            return orderConfirmOutput;
        }

        public async Task<AgentOrderDto> CreateOrder(OrderCreateInput input)
        {
            AgentOrderBoughtContext boughtContext = input.MapTo<AgentOrderBoughtContext>();
            boughtContext.AreaAgencys = AreaAgencyManager.GetAreaAgencysOfUser(InfrastructureSession.UserId.Value);
            boughtContext.ChannelAgency = ChannelAgencyManager.GetChannelAgencyOfUser(InfrastructureSession.UserId.Value);

            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtItem.UserId = InfrastructureSession.UserId.Value;
                boughtItem.Specification = SpecificationRepository.Get(boughtItem.SpecificationId);
            }
            AgentOrder order=await OrderCreator.CreateOrder(boughtContext);
            return order.MapTo<AgentOrderDto>();
        }
    }
}
