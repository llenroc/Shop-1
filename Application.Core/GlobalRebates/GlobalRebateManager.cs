using Application.Authorization.Users;
using Application.Orders.Entities;
using Application.Wallets;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.GlobalRebates
{
    public class GlobalRebateManager : ApplicationDomainServiceBase
    {
        public WalletManager WalletManager { get; set; }
        public WithdrawManager WithdrawManager { get; set; }
        public UserManager UserManager { get; set; }
        private IRepository<User, long> _userRepository;
        private IRepository<GlobalRebate> _globalRebateRepository;
        private IRepository<OrderGlobalRebate> _orderGlobalRebateRepository;

        public GlobalRebateManager(
            IRepository<User, long> userRepository,
            IRepository<GlobalRebate> globalRebateRepository,
            IRepository<OrderGlobalRebate> orderGlobalRebateRepository)
        {
            _userRepository = userRepository;
            _globalRebateRepository = globalRebateRepository;
            _orderGlobalRebateRepository = orderGlobalRebateRepository;
        }

        [UnitOfWork]
        public async Task TryAndCreateOrderGlobalRebateAsync(Order order)
        {
            CurrentUnitOfWork.SetTenantId(order.TenantId);
            List<GlobalRebate> globalRebates = _globalRebateRepository.GetAll().ToList();

            foreach(GlobalRebate globalRebate in globalRebates)
            {
                decimal money = globalRebate.Money > 0 ? globalRebate.Money: (decimal)globalRebate.Ratio * order.PayMoney;
                OrderGlobalRebate OrderGlobalRebate = new OrderGlobalRebate()
                {
                    UserId=globalRebate.UserId,
                    Money=money,
                    OrderId=order.Id
                };
                _orderGlobalRebateRepository.Insert(OrderGlobalRebate);
                await WalletManager.IncomeOfOrderRebateAsync(globalRebate.User.ToUserIdentifier(), money, L("GlobalRebate"), order);
                await WithdrawManager.WithdrawAllBalanceAsync(globalRebate.User.ToUserIdentifier());
            }
        }
    }
}
