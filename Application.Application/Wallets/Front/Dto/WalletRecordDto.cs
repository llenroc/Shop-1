using Application.Wallets.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wallets.Front.Dto
{
    [AutoMap(typeof(WalletRecord))]
    public class WalletRecordDto:AuditedEntityDto
    {
        public string SerialNumber { get; set; }

        public long? FromUserId { get; set; }

        public long? ToUserId { get; set; }

        public long UserId { get; set; }

        public WalletRecordType Type { get; set; }

        public string TypeText { get; set; }

        public PayType? PayType { get; set; }

        public decimal Money { get; set; }

        public string Remark { get; set; }

        public PayStatus PayStatus { get; set; }

        public string PayStatusText { get; set; }

        public DateTime? PayDateTime { get; set; }

        public FetchStatus FetchStatus { get; set; }

        public string FetchStatusText { get; set; }

        public DateTime? FetchDateTime { get; set; }

        public string FailReason { get; set; }
    }
}
