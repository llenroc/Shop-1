using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;
using Application.Orders.Entities;
using Application.Products.Orders.Entities;
using Application.Wallets;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Distributions
{
    public class ChannelAgentProductDistributionManager : ApplicationDomainServiceBase
    {
        public WalletManager WalletManager { get; set; }
        public UserManager UserManager { get; set; }
        private IRepository<User, long> _userRepository;
        private IRepository<OrderChannelAgentProductDistribution> _orderDistributionRepository;
        private IRepository<ProductOrder> _orderRepository;
        private IRepository<OrderItem> _orderItemRepository;

        public ChannelAgentProductDistributionManager(
           IRepository<User, long> userRepository,
           IRepository<OrderChannelAgentProductDistribution> orderDistributionRepository,
           IRepository<ProductOrder> orderRepository,
           IRepository<OrderItem> orderItemRepository)
        {
            _userRepository = userRepository;
            _orderRepository = orderRepository;
            _orderItemRepository = orderItemRepository;
            _orderDistributionRepository = orderDistributionRepository;
        }

        [UnitOfWork]
        public Task<List<OrderChannelAgentProductDistribution>> TryAndCreateOrderChannelAgentDistributionAsync(int orderId)
        {
            ProductOrder order = _orderRepository.Get(orderId);
            return TryAndCreateOrderChannelAgentDistributionAsync(order);
        }

        [UnitOfWork]
        public async Task<List<OrderChannelAgentProductDistribution>> TryAndCreateOrderChannelAgentDistributionAsync(ProductOrder order)
        {
            List<OrderChannelAgentProductDistribution> orderDistributions = new List<OrderChannelAgentProductDistribution>();

            using (CurrentUnitOfWork.SetTenantId(order.TenantId))
            {
                if (order.OrderItems == null)
                {
                    return orderDistributions;
                }
                foreach (OrderItem orderItem in order.OrderItems)
                {
                    int count = _orderItemRepository.GetAll().Where(model => model.CreatorUserId == order.UserId
                      && model.Order.PaymentStatus == PaymentStatus.Payed).Count();

                    var orderItems = _orderItemRepository.GetAll().Where(model => model.CreatorUserId == order.UserId
                     && model.Order.PaymentStatus == PaymentStatus.Payed).ToList();

                    if (!orderItem.IsGift && orderItem.Specification.Product.ChannelAgentProductDistributions.Count() > 0)
                    {
                        ChannelAgency channelAgency = null;

                        foreach (ChannelAgentProductDistribution distribution in orderItem.Specification.Product.ChannelAgentProductDistributions)
                        {
                            channelAgency = GetDistributionChannelAgency(order.User, distribution);

                            if (channelAgency != null)
                            {
                                OrderChannelAgentProductDistribution orderDistribution = await CreateOrderChannelAgentDistributionAsync(channelAgency.User, distribution, orderItem, order);

                                if (orderDistribution != null)
                                {
                                    orderDistributions.Add(orderDistribution);
                                }
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                }
                return orderDistributions;
            }
        }

        private decimal GetDistributionMoney(ChannelAgentProductDistribution distribution, OrderItem orderItem, ProductOrder order)
        {
            return distribution.Money > 0 ? distribution.Money * orderItem.Count : (decimal)distribution.Ratio * order.PayMoney;
        }

        [UnitOfWork]
        public async Task<OrderChannelAgentProductDistribution> CreateOrderChannelAgentDistributionAsync(User user, ChannelAgentProductDistribution distribution, OrderItem orderItem, ProductOrder order)
        {
            decimal money = GetDistributionMoney(distribution, orderItem, order);

            if (money == 0)
            {
                return null;
            }
            OrderChannelAgentProductDistribution orderDistribution = new OrderChannelAgentProductDistribution()
            {
                OrderId = order.Id,
                Money = money,
                OrderMoney = order.PayMoney,
                OrderItemId = orderItem.Id,
                UserId = user.Id,
                DistributionId = distribution.Id
            };
            _orderDistributionRepository.Insert(orderDistribution);
            CurrentUnitOfWork.SaveChanges();
            await WalletManager.IncomeOfOrderRebateAsync(user.ToUserIdentifier(), money, string.Format(L("ChannelAgentProductDistributionOfLevel"), distribution.Level), order);
            return orderDistribution;
        }

        [UnitOfWork]
        public ChannelAgency GetDistributionChannelAgency(User buyerUser, ChannelAgentProductDistribution distribution)
        {
            ChannelAgency channelAgency = UserManager.GetClosestChannelAgency(buyerUser);

            if (channelAgency != null && (distribution.MaxChannelAgentLevel.HasValue&& distribution.MaxChannelAgentLevel.Value< channelAgency.ChannelAgent.Level))
            {
                if(distribution.MaxChannelAgentLevel.HasValue && distribution.MaxChannelAgentLevel.Value < channelAgency.ChannelAgent.Level)
                {
                    return null;
                }

                if (distribution.MinChannelAgentLevel.HasValue && distribution.MinChannelAgentLevel.Value >channelAgency.ChannelAgent.Level)
                {
                    return null;
                }
            }
            return channelAgency;
        }
    }
}
