using Application.Scores.Front.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.Scores.Front
{
    public class ScoreRecordForFrontAppService : CrudAppService<ScoreRecord, ScoreRecordDto>, IScoreRecordForFrontAppService
    {
        public ScoreRecordForFrontAppService(IRepository<ScoreRecord> respository) :base(respository)
        {

        }
    }
}
