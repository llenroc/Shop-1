using Application.Group.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.GlobalRebates.End.Dto
{
    [AutoMap(typeof(GlobalRebate))]
    public class GlobalRebateDto:FullAuditedEntityDto
    {
        public long UserId { get; set; }

        public decimal Money { get; set; }

        public decimal Ratio { get; set; }

        public CustomerDto User { get; set; }
    }
}
