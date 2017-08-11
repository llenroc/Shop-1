using Application.Wallets.Entities;
using Infrastructure.Domain.UnitOfWork;
using System.Threading.Tasks;

namespace Application.Wallets.WithdrawProviders
{
    public class ManualWithdrawProvider : WithdrawProviderBase, IWithdrawProvider
    {
        public new static PayType PayType { get; set; } = PayType.Unknow;
        public WithdrawManager WithdrawManager { get; set; }

        [UnitOfWork]
        public async Task Withdraw(WithdrawApply withdrawApply)
        {
            WithdrawManager.WithdrawNotify(withdrawApply.Id, PayType, true);
        }
    }
}
