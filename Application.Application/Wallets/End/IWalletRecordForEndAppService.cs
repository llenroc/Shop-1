using Application.Wallets.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Wallets.End
{
    public interface IWalletRecordForEndAppService : ICrudAppService<
        WalletRecordDto,
        int,
        WalletRecordGetAllInput>
    {
    }
}
