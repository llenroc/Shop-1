using Application.Scores.Front.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using Infrastructure.Runtime.Session;

namespace Application.Scores.Front
{
    public class ScoreForFrontAppService : CrudAppService<Score, ScoreDto>, IScoreForFrontAppService
    {
        public ScoreManager ScoreManager { get; set; }

        public ScoreForFrontAppService(IRepository<Score> respository) :base(respository)
        {

        }

        public ScoreInfoOutput GetScoreInfo()
        {
            Score score = ScoreManager.GetScore(InfrastructureSession.ToUserIdentifier());
            ScoreInfoOutput scoreInfoOutput = new ScoreInfoOutput()
            {
                Balance = score.Total,
                Total = ScoreManager.GetInScore(InfrastructureSession.ToUserIdentifier())
            };
            return scoreInfoOutput;
        }
    }
}
