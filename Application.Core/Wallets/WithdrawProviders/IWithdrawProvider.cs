using Application.Wallets.Entities;
using Infrastructure.Domain.Services;
using System.Threading.Tasks;

namespace Application.Wallets.WithdrawProviders
{
    public interface IWithdrawProvider:IDomainService
    {
        Task Withdraw(WithdrawApply withdrawApply);
    }
}
