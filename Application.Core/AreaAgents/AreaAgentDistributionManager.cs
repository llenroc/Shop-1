using Application.AreaAgents.AreaAgencyApplys;
using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Authorization.Users;
using Application.Wallets;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.AreaAgents
{
    public class AreaAgentDistributionManager : ApplicationDomainServiceBase
    {
        public UserManager UserManager { get; set; }
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<OrderAreaAgentDistribution> OrderAreaAgentDistributionRepository { get; set; }
        public IRepository<AreaAgencyApplyOrder> OrderRepository { get; set; }
        public IRepository<AreaAgent> AreaAgentRepository { get; set; }
        public IRepository<AreaAgencyApply> AreaAgencyApplyRepository { get; set; }
        public WalletManager WalletManager { get; set; }

        [UnitOfWork]
        public Task<List<OrderAreaAgentDistribution>> TryAndCreateOrderDistributionAsync(int orderId)
        {
            AreaAgencyApplyOrder order = OrderRepository.Get(orderId);
            return TryAndCreateOrderDistributionAsync(order);
        }

        [UnitOfWork]
        public async Task<List<OrderAreaAgentDistribution>> TryAndCreateOrderDistributionAsync(AreaAgencyApplyOrder order)
        {
            List<OrderAreaAgentDistribution> orderDistributions = new List<OrderAreaAgentDistribution>();
            AreaAgencyApply areaAgencyApply = AreaAgencyApplyRepository.GetAll().Where(model => model.OrderId == order.Id).FirstOrDefault();

            using (CurrentUnitOfWork.SetTenantId(order.TenantId))
            {
                foreach (AreaAgentDistribution distribution in areaAgencyApply.AreaAgent.AreaAgentDistributions)
                {
                    User user = GetDistributionUser(order.User, distribution);

                    if (user != null&&user.IsAreaAgency)
                    {
                        OrderAreaAgentDistribution orderAreaAgentDistribution = await CreateOrderDistributionAsync(user, distribution, areaAgencyApply.AreaAgent, order);

                        if (orderAreaAgentDistribution != null)
                        {
                            orderDistributions.Add(orderAreaAgentDistribution);
                        }
                    }
                }
                return orderDistributions;
            }
        }

        private decimal GetDistributionMoney(AreaAgentDistribution distribution, AreaAgent areaAgent)
        {
            return distribution.Money > 0 ? distribution.Money : (decimal)distribution.Ratio * areaAgent.Price;
        }

        [UnitOfWork]
        public async Task<OrderAreaAgentDistribution> CreateOrderDistributionAsync(User user, AreaAgentDistribution distribution, AreaAgent areaAgent, AreaAgencyApplyOrder order)
        {
            decimal money = GetDistributionMoney(distribution, areaAgent);

            if (money == 0)
            {
                return null;
            }
            OrderAreaAgentDistribution orderDistribution = new OrderAreaAgentDistribution()
            {
                OrderId = order.Id,
                Money = money,
                OrderMoney = order.PayMoney,
                UserId = user.Id,
                DistributionId = distribution.Id
            };
            OrderAreaAgentDistributionRepository.Insert(orderDistribution);
            CurrentUnitOfWork.SaveChanges();
            await WalletManager.IncomeOfOrderRebateAsync(user.ToUserIdentifier(), money, string.Format(L("AreaAgentDistributionOfLevel"), distribution.Level), order,false);
            return orderDistribution;
        }

        [UnitOfWork]
        public User GetDistributionUser(User buyerUser, AreaAgentDistribution distribution)
        {
            User distributionUser = UserManager.GetParentUserOfDepth(buyerUser, distribution.Level);

            if (distributionUser != null && !distributionUser.IsSpreader)
            {
                return null;
            }
            return distributionUser;
        }
    }
}
