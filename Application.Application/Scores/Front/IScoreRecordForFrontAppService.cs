using Application.Scores.Front.Dto;
using Infrastructure.Application.Services;

namespace Application.Scores.Front
{
    public interface IScoreRecordForFrontAppService : ICrudAppService<ScoreRecordDto>
    {
    }
}
