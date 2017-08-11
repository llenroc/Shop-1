using Application.Wallets.Entities;

namespace Application.Wallets.End.Dto
{
    public class WithdrawInput
    {
        public int Id { get; set; }
        public WithdrawMethod? WithdrawMethod { get; set; }
    }
}
