using Application.Wallets.Front.Dto;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Wallets.Front
{
    public interface IWalletAppService: IApplicationService
    {
        WalletInfoOutput GetWalletInfo();
        Task Withdraw();
    }
}
