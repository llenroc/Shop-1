using Application.Group.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Scores.End.Dto
{
    [AutoMap(typeof(Score))]
    public class ScoreDto : EntityDto
    {
        public int Total { get; set; }

        public CustomerDto User { get; set; }
    }
}
