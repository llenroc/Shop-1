using Application.Scores.Front.Dto;
using Infrastructure.Application.Services;

namespace Application.Scores.Front
{
    public interface IScoreForFrontAppService : ICrudAppService<ScoreDto>
    {
        ScoreInfoOutput GetScoreInfo();
    }
}
