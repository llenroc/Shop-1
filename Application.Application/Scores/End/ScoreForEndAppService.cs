using Application.Scores.End.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.Scores.End
{
    public class ScoreForEndAppService : CrudAppService<Score, ScoreDto>, IScoreForEndAppService
    {
        public ScoreForEndAppService(IRepository<Score> respository) :base(respository)
        {

        }
    }
}
