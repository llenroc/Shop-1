using Application.Wallets.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Wallets.End
{
    public interface IWithdrawForEndAppService : ICrudAppService<
        WithdrawApplyDto,
        int,
        WithdrawApplyGetAllInput>
    {
        Task Withdraw(IdInput input);
    }
}
