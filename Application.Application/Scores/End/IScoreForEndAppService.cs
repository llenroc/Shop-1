using Application.Scores.End.Dto;
using Infrastructure.Application.Services;

namespace Application.Scores.End
{
    public interface IScoreForEndAppService : ICrudAppService<ScoreDto>
    {
    }
}
