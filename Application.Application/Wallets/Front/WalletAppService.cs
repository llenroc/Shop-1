using Application.Wallets.Entities;
using Application.Wallets.Front.Dto;
using Infrastructure.Domain.Repositories;
using Infrastructure.Runtime.Session;
using Infrastructure.UI;
using System;
using System.Threading.Tasks;

namespace Application.Wallets.Front
{
    public class WalletAppService: ApplicationAppServiceBase, IWalletAppService
    {
        private readonly IRepository<Wallet> _walletRepository;
        public WalletManager WalletManager { get; set; }
        public WithdrawManager WithdrawManager { get; set; }

        public WalletAppService(IRepository<Wallet> walletRepository)
        {
            _walletRepository = walletRepository;
        }

        public async Task Withdraw()
        {
            try
            {
                await WithdrawManager.WithdrawAllBalanceAsync(InfrastructureSession.ToUserIdentifier());
            }
            catch(Exception exception)
            {
                throw new UserFriendlyException(exception.Message, exception);
            }
        }

        public WalletInfoOutput GetWalletInfo()
        {
            try
            {
                Wallet wallet = WalletManager.GetWalletOfUser(InfrastructureSession.ToUserIdentifier());
                WalletInfoOutput walletInfoOutput = new WalletInfoOutput()
                {
                    Balance = wallet.Money,
                    Freezing = WalletManager.GetMoneyOfFreezing(InfrastructureSession.UserId.Value),
                    Withdrawed = WalletManager.GetMoneyOfWithdrawed(InfrastructureSession.UserId.Value),
                    Withdrawing = WalletManager.GetMoneyOfWithdrawing(InfrastructureSession.UserId.Value),
                    TotalIncome = WalletManager.GetMoneyOfRecharge(InfrastructureSession.UserId.Value)
                };
                return walletInfoOutput;
            }
            catch(Exception exception)
            {
                throw new UserFriendlyException(exception.Message);
            }
        }
    }
}
