using Application.Wallets.Entities;
using System;

namespace Application.Wallets
{
    public class WithdrawException:Exception
    {
        public PayType PayType { get; set; }

        public WithdrawException(PayType payType)
        {
            PayType = payType;
        }

        public WithdrawException(PayType payType, string message):base(message)
        {
            PayType = payType;
        }
    }
}
