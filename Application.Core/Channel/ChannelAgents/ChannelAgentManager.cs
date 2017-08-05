using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;
using Application.Products.Orders.Entities;
using Application.Wallets;
using Infrastructure.Domain.Repositories;

namespace Application.Channel.ChannelAgents
{
    public class ChannelAgentManager: ApplicationDomainServiceBase
    {
        public IRepository<User,long> UserRepository { get; set; }
        public IRepository<ChannelAgent> ChannelAgentRepository { get; set; }
        public IRepository<ProductOrder> OrderRepository { get; set; }
        public IRepository<ChannelAgency> ChannelAgencyRepository { get; set; }
        public IRepository<ChannelAgentRebate> ChannelAgentRebateRepository{get;set;}
        public WalletManager WalletManager { get; set; }
    }
}
