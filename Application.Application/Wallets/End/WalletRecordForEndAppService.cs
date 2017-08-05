using Application.Wallets.End.Dto;
using Application.Wallets.Entities;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.Wallets.End
{
    public class WalletRecordForEndAppService : CrudAppService<
        WalletRecord,
        WalletRecordDto,
        int,
        WalletRecordGetAllInput
        >, IWalletRecordForEndAppService
    {
        public WalletManager WalletManager { get; set; }
        public WalletRecordForEndAppService(IRepository<WalletRecord> repository) :base(repository)
        {

        }
    }
}
