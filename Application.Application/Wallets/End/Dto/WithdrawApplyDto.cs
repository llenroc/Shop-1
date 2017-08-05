using Application.Group.Dto;
using Application.Wallets.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Wallets.End.Dto
{
    [AutoMap(typeof(WithdrawApply))]
    public class WithdrawApplyDto : AuditedEntityDto
    {
        public CustomerDto User { get; set; }
        public string SerialNumber { get; set; }
        public decimal Money { get; set; }
        public PayType? PayType { get; set; }
        public WithdrawStatus Status { get; set; }
        public string StatusText { get; set; }
        public string FailReason { get; set; }
    }
}
