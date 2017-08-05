using Application.Wallets.Entities;
using Application.Wallets.Front.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Linq;

namespace Application.Wallets.Front
{
    public class WalletRecordAppService : CrudAppService<
        WalletRecord,
        WalletRecordDto,
        int,
        WalletRecordGetAllInput
        >, IWalletRecordAppService
    {
        public WalletRecordAppService(IRepository<WalletRecord> repository) :base(repository)
        {

        }

        protected override IQueryable<WalletRecord> CreateFilteredQuery(WalletRecordGetAllInput input)
        {
            return Repository.GetAll().Where(model => model.UserId ==InfrastructureSession.UserId.Value);
        }
    }
}
