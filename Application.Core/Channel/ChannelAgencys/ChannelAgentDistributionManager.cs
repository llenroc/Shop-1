using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Channel.ChannelAgents;
using Application.Wallets;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Channel.ChananlAgencys
{
    public class ChannelAgentDistributionManager : ApplicationDomainServiceBase
    {
        public UserManager UserManager { get; set; }
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<OrderChannelAgentDistribution> OrderChannelAgentDistributionRepository { get; set; }
        public IRepository<ChannelAgencyApplyOrder> OrderRepository { get; set; }
        public IRepository<ChannelAgent> ChannelAgentRepository { get; set; }
        public IRepository<ChannelAgencyApply> ChannelAgencyApplyRepository { get; set; }
        public WalletManager WalletManager { get; set; }

        [UnitOfWork]
        public Task<List<OrderChannelAgentDistribution>> TryAndCreateOrderDistributionAsync(int orderId)
        {
            ChannelAgencyApplyOrder order = OrderRepository.Get(orderId);
            return TryAndCreateOrderDistributionAsync(order);
        }

        [UnitOfWork]
        public async Task<List<OrderChannelAgentDistribution>> TryAndCreateOrderDistributionAsync(ChannelAgencyApplyOrder order)
        {
            List<OrderChannelAgentDistribution> orderDistributions = new List<OrderChannelAgentDistribution>();
            ChannelAgencyApply channelAgencyApply = ChannelAgencyApplyRepository.GetAll().Where(model => model.OrderId == order.Id).FirstOrDefault();

            using (CurrentUnitOfWork.SetTenantId(order.TenantId))
            {
                foreach (ChannelAgentDistribution distribution in channelAgencyApply.ChannelAgent.ChannelAgentDistributions)
                {
                    User user = GetDistributionUser(order.User, distribution);

                    if (user != null)
                    {
                        OrderChannelAgentDistribution orderChannelAgentDistribution = await CreateOrderDistributionAsync(user, distribution, channelAgencyApply.ChannelAgent, order);

                        if (orderChannelAgentDistribution != null)
                        {
                            orderDistributions.Add(orderChannelAgentDistribution);
                        }
                    }
                }
                return orderDistributions;
            }
        }

        private decimal GetDistributionMoney(ChannelAgentDistribution distribution,ChannelAgent channelAgent)
        {
            return distribution.Money>0?distribution.Money:(decimal)distribution.Ratio * channelAgent.Price;
        }

        [UnitOfWork]
        public async Task<OrderChannelAgentDistribution> CreateOrderDistributionAsync(User user, ChannelAgentDistribution distribution, ChannelAgent channelAgent,ChannelAgencyApplyOrder order)
        {
            decimal money = GetDistributionMoney(distribution, channelAgent);

            if (!user.IsChannelAgency)
            {
                money*= (decimal)distribution.NonAgencyRatio;
            }

            if (money == 0)
            {
                return null;
            }
            OrderChannelAgentDistribution orderDistribution = new OrderChannelAgentDistribution()
            {
                OrderId = order.Id,
                Money = money,
                OrderMoney = order.PayMoney,
                UserId = user.Id,
                DistributionId = distribution.Id
            };
            OrderChannelAgentDistributionRepository.Insert(orderDistribution);
            CurrentUnitOfWork.SaveChanges();
            await WalletManager.IncomeOfOrderRebateAsync(user.ToUserIdentifier(), money, string.Format(L("ChannelAgentDistributionOfLevel"), distribution.Level), order,false);
            return orderDistribution;
        }

        [UnitOfWork]
        public User GetDistributionUser(User buyerUser, ChannelAgentDistribution distribution)
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
