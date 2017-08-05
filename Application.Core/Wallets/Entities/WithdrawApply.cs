using Application.Entities;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Wallets.Entities
{
    public enum WithdrawStatus
    {
        Withdrawing,
        Success,
        Fail,
        Invalid
    }

    public class WithdrawApply: FullAuditedUserIdentifierEntity
    {
        public string SerialNumber { get; set; }
        public decimal Money { get; set; }
        public PayType? PayType { get; set; }
        public WithdrawStatus Status { get; set; }
        public virtual WalletRecord WalletRecord { get; set; }
        public string FailReason { get; set; }

        public string GetStatusText()
        {
            return Status.ToString();
        }
    }
}
