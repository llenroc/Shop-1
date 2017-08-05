using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Scores.Front.Dto
{
    [AutoMap(typeof(Score))]
    public class ScoreDto : EntityDto
    {
        public int Total { get; set; }
    }
}
