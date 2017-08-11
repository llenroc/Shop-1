using Application.Wallets.End.Dto;
using Application.Wallets.Entities;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System;
using System.Threading.Tasks;

namespace Application.Wallets.End
{
    public class WithdrawForEndAppService : CrudAppService<
        WithdrawApply,
        WithdrawApplyDto,
        int,
        WithdrawApplyGetAllInput
        >, IWithdrawForEndAppService
    {
        public WalletManager WalletManager { get; set; }
        public WithdrawManager WithdrawManager { get; set; }
        public WithdrawForEndAppService(IRepository<WithdrawApply> repository) :base(repository)
        {

        }

        public async Task Withdraw(WithdrawInput input)
        {
            try
            {
                if (input.WithdrawMethod.HasValue)
                {
                    await WithdrawManager.ProcessWithdrawAsync(input.Id,input.WithdrawMethod.Value);
                }
                else
                {
                    await WithdrawManager.ProcessWithdrawAsync(input.Id);
                }
            }
            catch (Exception e)
            {
                throw new UserFriendlyException(e.Message);
            }
        }
    }
}
