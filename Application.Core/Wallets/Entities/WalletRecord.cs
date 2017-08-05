using Application.Authorization.Users;
using Application.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System;
using System.ComponentModel.DataAnnotations;

namespace Application.Wallets.Entities
{
    public enum PayType
    {
        Undetermined,
        Alipay,
        WeChat,
        BankCard,
        Balance
    }

    public enum PayStatus
    {
        UnPay,
        Success,
        Fail
    }

    public enum WalletRecordType
    {
        Recharge,
        InCome,
        Withdraw,
        Transaction
    }

    public enum WalletRecordStatus
    {
        Actived,
        Freezing,
        Invalid
    }

    public enum FetchStatus
    {
        UnFetch,
        Success,
        Fail
    }

    public class WalletRecord : FullAuditedEntity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }

        [Required]
        public string SerialNumber { get; set; }

        public WalletRecordStatus Status { get; set; }

        public string FreezeKey { get; set; }

        public long? FromUserId { get; set; }

        public virtual WithdrawApply WithdrawApply { get; set; }

        public long? ToUserId { get; set; }

        public long UserId { get; set; }

        public virtual User User { get; set; }

        public WalletRecordType Type { get; set; }

        public PayType? PayType { get; set; }

        public decimal Money { get; set; }

        public string Remark { get; set; }

        public PayStatus PayStatus { get; set; } = PayStatus.UnPay;

        public DateTime? PayDateTime { get; set; }

        public FetchStatus FetchStatus { get; set; } = FetchStatus.UnFetch;

        //冻结期限。如果当前处于冻结状态，冻结期限null表示永久冻结。
        public DateTime? FreezingLimit { get; set; }

        public DateTime? FetchDateTime { get; set; }

        public string FailReason { get; set; }

        public string GetTypeText()
        {
            return Type.ToString();
        }

        public string GetStatusText()
        {
            return Status.ToString();
        }

        public string GetPayStatusText()
        {
            return PayStatus.ToString();
        }

        public string GetFetchStatusText()
        {
            return FetchStatus.ToString();
        }

        public WalletRecord()
        {

        }

        public WalletRecord(WalletRecordType type,long userId, decimal money,string remark)
        {
            Type = type;
            UserId = userId;
            Money = money;
            Remark = remark;
        }
    }
}
