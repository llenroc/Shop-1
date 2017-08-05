using Application.Group.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Scores.End.Dto
{
    [AutoMap(typeof(ScoreRecord))]
    public class ScoreRecordDto:FullAuditedEntityDto
    {
        public int Score { get; set; }

        public string Remark { get; set; }

        public CustomerDto User { get; set; }
    }
}
