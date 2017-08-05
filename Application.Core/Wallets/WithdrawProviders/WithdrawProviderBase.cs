using Application.Wallets.Entities;

namespace Application.Wallets.WithdrawProviders
{
    public class WithdrawProviderBase : ApplicationDomainServiceBase
    {
        public static PayType PayType { get; set; }
    }
}
