using Application.Channel.ChananlAgencys;
using Application.CustomerInfos;
using Application.CustomerInfos.Dto;
using Application.Customers;
using Application.Orders.Entities;
using Application.Orders.Fronts.Dto;
using Application.Orders.Fronts.Products.Dto;
using Application.Products;
using Application.Products.Orders;
using Application.Products.Orders.Entities;
using Application.Products.Orders.Postages;
using Application.ShopCarts;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using Infrastructure.UI;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.Products
{
    public class ProductOrderAppService : CrudAppService<
            ProductOrder,
            ProductOrderDto,
            int,
            OrderGetAllInput,
            ProductOrderDto,
            ProductOrderDto, OrderGetInput, OrderGetInput>
        , IProductOrderAppService
    {
        protected IRepository<OrderItem> OrderItemRepository;
        protected IRepository<Product> ProductRepository;
        protected IRepository<Specification> SpecificationRepository;
        protected IRepository<CustomerInfo> CustomerInfoRepository;

        public ProductOrderManager OrderManager { get; set; }
        protected ProductOrderCreator OrderCreator;
        public ProductSalePriceService ProductSalePriceService { get; set; }
        public PostageService PostageService { get; set; }
        public CustomerInfoManager CustomerInfoManager { get; set; }
        public ChannelAgencyManager ChannelAgencyManager { get; set; }
        public ShopCartManager ShopCartManager { get; set; }

        public ProductOrderAppService(IRepository<ProductOrder> repository,
            IRepository<OrderItem> orderItemRepository,
            IRepository<Product> productRepository,
            IRepository<Specification> specificationRepository,
            IRepository<CustomerInfo> customerInfoRepository,
            ProductOrderCreator orderCreate) : base(repository)
        {
            OrderItemRepository = orderItemRepository;
            ProductRepository = productRepository;
            SpecificationRepository = specificationRepository;
            CustomerInfoRepository = customerInfoRepository;
            OrderCreator = orderCreate;
        }

        protected override IQueryable<ProductOrder> CreateFilteredQuery(OrderGetAllInput input)
        {
            return Repository.GetAll().Where(model=>model.CreatorUserId==InfrastructureSession.UserId)
                .WhereIf(input.OrderStatus!=null,model=>model.OrderStatus==input.OrderStatus);
        }

        public OrderForCommentDto GetOrderForComment(IdInput input)
        {
            ProductOrder order = Repository.Get(input.Id);
            OrderManager.Receive(order);
            return order.MapTo<OrderForCommentDto>();
        }

        public OrderItemWithCommentDto Comment(CommentInput input)
        {
            OrderItem orderItem = OrderItemRepository.Get(input.OrderItemId);

            if (orderItem.IsCommented)
            {
                throw new UserFriendlyException(L("YouHasCommented"));
            }
            ProductOrder order = Repository.Get(orderItem.OrderId) as ProductOrder;

            if (order.OrderStatus != OrderStatus.Received)
            {
                throw new UserFriendlyException(L("YouCannnotCommentTheOrderInCurrentStatus"));
            }
            orderItem.IsCommented = true;
            orderItem.Comment = new ProductComment()
            {
                ProductId = orderItem.Specification.ProductId,
                Content = input.Content,
                OrderId = orderItem.OrderId,
            };
            OrderItemRepository.Update(orderItem);
            CurrentUnitOfWork.SaveChanges();

            var isCompletedComment = true;

            foreach (OrderItem orderItemInOrder in order.OrderItems)
            {
                if (!orderItemInOrder.IsCommented)
                {
                    isCompletedComment = false;
                }
            }

            if (isCompletedComment)
            {
                order.OrderStatus = OrderStatus.Completed;
            }
            CurrentUnitOfWork.SaveChanges();
            return orderItem.MapTo<OrderItemWithCommentDto>();
        }

        public List<BoughtItemOutput> GetBoughtItemsFromShopCart()
        {
            ShopCart ShopCart = ShopCartManager.GetShopCart(InfrastructureSession.UserId.Value);
            List<BoughtItemOutput> boughtItems = new List<BoughtItemOutput>();

            foreach (ShopCartItem shopCartItem in ShopCart.ShopCartItems)
            {
                boughtItems.Add(new BoughtItemOutput()
                {
                    SpecificationId=shopCartItem.SpecificationId,
                    Count=shopCartItem.Count,
                    CartItemId=shopCartItem.Id,
                });
            }
            return boughtItems;
        }

        public OrderConfirmOutput ConfirmOrder(OrderConfirmInput input)
        {
            ProductBoughtContext boughtContext = input.MapTo<ProductBoughtContext>();

            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtItem.UserId = InfrastructureSession.UserId.Value;
                boughtItem.Specification = SpecificationRepository.Get(boughtItem.SpecificationId);
            }
            ProductSalePriceService.Calculate(boughtContext);
            PostageService.ComputePostage(boughtContext);
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

        public async Task<ProductOrderDto> CreateOrder(OrderCreateInput input)
        {
            ProductBoughtContext boughtContext = input.MapTo<ProductBoughtContext>();
            ProductOrder order=await OrderCreator.CreateOrder(boughtContext);
            return order.MapTo<ProductOrderDto>();
        }

        public ProductOrderDto Receive(IdInput input)
        {
            ProductOrder order = Repository.Get(input.Id);
            OrderManager.Receive(order);
            return order.MapTo<ProductOrderDto>();
        }

        public void CloseOrder(IdInput input)
        {
            ProductOrder order = Repository.Get(input.Id);
            OrderManager.CloseOrder(order);
        }
    }
}
