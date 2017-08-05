using Application.CustomerInfos;
using Application.CustomerInfos.Dto;
using Application.Customers;
using Application.Orders.Fronts.Dto;
using Application.Orders.Fronts.Products.Dto;
using Application.Orders.Fronts.ScoreExchange.Dto;
using Application.Products;
using Application.Products.Orders;
using Application.Products.Orders.Entities;
using Application.Products.Orders.Postages;
using Application.Scores.Orders;
using Application.Scores.Orders.Entities;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.ScoreExchange
{
    public class ScoreExchangeOrderAppService : CrudAppService<
            ScoreExchangeOrder,
            ScoreExchangeOrderDto,
            int,
            OrderGetAllInput,
            ScoreExchangeOrderDto,
            ScoreExchangeOrderDto, OrderGetInput, OrderGetInput>,IScoreExchangeOrderAppService
    {
        protected IRepository<OrderItem> OrderItemRepository;
        protected IRepository<Product> ProductRepository;
        protected IRepository<Specification> SpecificationRepository;
        protected IRepository<CustomerInfo> CustomerInfoRepository;
        protected ScoreExchangeOrderCreator OrderCreator;
        public PostageService<ScoreExchangeOrder> PostageService { get; set; }
        public CustomerInfoManager CustomerInfoManager { get; set; }

        public ScoreExchangeOrderAppService(IRepository<ScoreExchangeOrder> repository,
            IRepository<OrderItem> orderItemRepository,
            IRepository<Product> productRepository,
            IRepository<Specification> specificationRepository,
            IRepository<CustomerInfo> customerInfoRepository,
            ScoreExchangeOrderCreator orderCreate) : base(repository)
        {
            OrderItemRepository = orderItemRepository;
            ProductRepository = productRepository;
            SpecificationRepository = specificationRepository;
            CustomerInfoRepository = customerInfoRepository;
            OrderCreator = orderCreate;
        }

        public OrderConfirmOutput ConfirmOrder(OrderConfirmInput input)
        {
            ScoreExchangeBoughtContext boughtContext = input.MapTo<ScoreExchangeBoughtContext>();

            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtItem.UserId = InfrastructureSession.UserId.Value;
                boughtItem.Specification = SpecificationRepository.Get(boughtItem.SpecificationId);
            }
            PostageService.ComputePostage(boughtContext as ProductBoughtContext<ScoreExchangeOrder>);
            OrderConfirmOutput orderConfirmOutput = boughtContext.MapTo<OrderConfirmOutput>();
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

        public async Task<ScoreExchangeOrderDto> CreateOrder(OrderCreateInput input)
        {
            ScoreExchangeBoughtContext boughtContext = input.MapTo<ScoreExchangeBoughtContext>();

            try
            {
                ScoreExchangeOrder order = await OrderCreator.CreateOrder(boughtContext);
                return order.MapTo<ScoreExchangeOrderDto>();
            }
            catch(Exception e)
            {
                throw new UserFriendlyException(e.Message,e);
            }
        }
    }
}
