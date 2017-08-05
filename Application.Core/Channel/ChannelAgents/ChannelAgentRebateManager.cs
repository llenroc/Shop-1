using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;
using Application.Entities;
using Application.Products.Orders.Entities;
using Application.Wallets;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Channel.ChannelAgents
{
    public class ChannelAgentRebateManager : ApplicationDomainServiceBase
    {
        public IRepository<ChannelAgentRebate> ChannelAgentRebateRepository { get; set; }
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<ChannelAgent> ChannelAgentRepository { get; set; }
        public IRepository<ProductOrder> OrderRepository { get; set; }
        public IRepository<ChannelAgency> ChannelAgencyRepository { get; set; }
        public WalletManager WalletManager { get; set; }

        public decimal GetTotalRebateOfChannelAgency(int channelAgencyId)
        {
            return ChannelAgentRebateRepository.GetAll().Where(model => model.ChannelAgentId == channelAgencyId).Sum(model => (decimal?)model.Money) ?? 0;
        }

        [UnitOfWork]
        public async Task<List<ChannelAgentRebate>> TryAndCreateOrderChannelAgentRebatesAsync(int orderId)
        {
            ProductOrder order = OrderRepository.Get(orderId);
            List<ChannelAgentRebate> channelAgentRebates = await TryAndCreateOrderChannelAgentRebatesAsync(order);
            return channelAgentRebates;
        }

        [UnitOfWork]
        public async Task<List<ChannelAgentRebate>> TryAndCreateOrderChannelAgentRebatesAsync(ProductOrder order)
        {
            using (CurrentUnitOfWork.SetTenantId(order.TenantId))
            {
                User user = order.User;
                List<ChannelAgentRebate> channelAgentRebates = new List<ChannelAgentRebate>();

                if (user.ChannelAgencyId.HasValue)
                {
                    ChannelAgency channelAgency = ChannelAgencyRepository.Get(user.ChannelAgencyId.Value);
                    float totalRebateRatio = 0;

                    await Task.Run(() =>
                    {
                        TryAndCreateOrderChannelAgentRebate(channelAgency, order, ref totalRebateRatio, user.ChannelAgentDepth, ref channelAgentRebates);
                    });
                }
                return channelAgentRebates;
            }
        }

        public void TryAndCreateOrderChannelAgentRebate(ChannelAgency channelAgency, ProductOrder order, ref float totalRebateRatio, int depth, ref List<ChannelAgentRebate> channelAgentRebates)
        {
            if (order.ChannelAgentRebate <= 0)
            {
                return;
            }
            float rebateRatio = channelAgency.ChannelAgent.RebateRatio - totalRebateRatio;

            if (rebateRatio > 0)
            {
                decimal money = order.ChannelAgentRebate * (decimal)rebateRatio;

                ChannelAgentRebate channelAgentRebate = new ChannelAgentRebate()
                {
                    OrderId = order.Id,
                    UserId = channelAgency.UserId,
                    ChannelAgentId = channelAgency.ChannelAgentId,
                    ChannlAgencyId = channelAgency.Id,
                    RebateRatio = rebateRatio,
                    Money = money,
                    Depth = depth
                };
                ChannelAgentRebateRepository.Insert(channelAgentRebate);
                CurrentUnitOfWork.SaveChanges();

                AsyncHelper.RunSync(async () => {
                    await WalletManager.IncomeOfOrderRebateAsync(channelAgency.GetUserIdentifier(), channelAgentRebate.Money, "ChannelAgentRebate", order,true);
                });
                totalRebateRatio += rebateRatio;

                if (channelAgency.User.ChannelAgencyId.HasValue)
                {
                    depth += channelAgency.User.ChannelAgentDepth;
                    ChannelAgency parentChannelAgency = ChannelAgencyRepository.Get(channelAgency.User.ChannelAgencyId.Value);
                    TryAndCreateOrderChannelAgentRebate(parentChannelAgency, order, ref totalRebateRatio, depth, ref channelAgentRebates);
                }
            }
        }
    }
}
