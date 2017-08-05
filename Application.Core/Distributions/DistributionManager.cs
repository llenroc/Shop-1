using Application.Authorization.Users;
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
    public class DistributionManager: ApplicationDomainServiceBase
    {
        public WalletManager WalletManager { get; set; }
        public UserManager UserManager { get; set; }
        private IRepository<User,long> _userRepository;
        private IRepository<OrderDistribution> _orderDistributionRepository;
        private IRepository<ProductOrder> _orderRepository;
        private IRepository<OrderItem> _orderItemRepository;

        public DistributionManager(
            IRepository<User,long> userRepository,
            IRepository<OrderDistribution> orderDistributionRepository,
            IRepository<ProductOrder> orderRepository,
            IRepository<OrderItem> orderItemRepository)
        {
            _userRepository = userRepository;
            _orderRepository = orderRepository;
            _orderItemRepository = orderItemRepository;
            _orderDistributionRepository = orderDistributionRepository;
        }

        [UnitOfWork]
        public Task<List<OrderDistribution>> TryAndCreateOrderDistributionAsync(int orderId)
        {
            ProductOrder order = _orderRepository.Get(orderId);
            return TryAndCreateOrderDistributionAsync(order);
        }

        [UnitOfWork]
        public async Task<List<OrderDistribution>> TryAndCreateOrderDistributionAsync(ProductOrder order)
        {
            List<OrderDistribution> orderDistributions = new List<OrderDistribution>();

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

                    if (!orderItem.IsGift&&orderItem.Specification.Product.Distributions.Count() > 0)
                    {
                        foreach (Distribution distribution in orderItem.Specification.Product.Distributions)
                        {
                            if ((distribution.BuyWhen == BuyWhen.NoLimit) ||
                                (distribution.BuyWhen == BuyWhen.First && count <=1) ||
                                (distribution.BuyWhen == BuyWhen.Next && count > 1))
                            {
                                User user = GetDistributionUser(order.User, distribution);

                                if (user != null)
                                {
                                    OrderDistribution orderDistribution = await CreateOrderDistributionAsync(user, distribution, orderItem, order);

                                    if (orderDistribution != null)
                                    {
                                        orderDistributions.Add(orderDistribution);
                                    }
                                }
                            }
                        }
                    }
                }
                return orderDistributions;
            }
        }

        private decimal GetDistributionMoney(Distribution distribution, OrderItem orderItem, ProductOrder order)
        {
            return distribution.Money > 0 ? distribution.Money * orderItem.Count: (decimal)distribution.Ratio * order.PayMoney;
        }

        [UnitOfWork]
        public async Task<OrderDistribution> CreateOrderDistributionAsync(User user,Distribution distribution,OrderItem orderItem, ProductOrder order)
        {
            decimal money = GetDistributionMoney(distribution, orderItem,order);

            if (money == 0)
            {
                return null;
            }
            OrderDistribution orderDistribution = new OrderDistribution()
            {
                OrderId= order.Id,
                Money= money,
                OrderMoney=order.PayMoney,
                OrderItemId = orderItem.Id,
                UserId=user.Id,
                DistributionId=distribution.Id
            };
            _orderDistributionRepository.Insert(orderDistribution);
            CurrentUnitOfWork.SaveChanges();
            await WalletManager.IncomeOfOrderRebateAsync(user.ToUserIdentifier(), money, string.Format(L("DistributionOfLevel"),distribution.Level), order);
            return orderDistribution;
        }

        [UnitOfWork]
        public User GetDistributionUser(User buyerUser, Distribution distribution)
        {
            User distributionUser = UserManager.GetParentUserOfDepth(buyerUser, distribution.Level);

            if (distributionUser!=null&&!distributionUser.IsSpreader)
            {
                return null;
            }
            return distributionUser;
        }
    }
}
