using Application.Scores.End.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.Scores.End
{
    public class ScoreRecordForEndAppService : CrudAppService<ScoreRecord, ScoreRecordDto>, IScoreRecordForEndAppService
    {
        public ScoreRecordForEndAppService(IRepository<ScoreRecord> respository) :base(respository)
        {

        }
    }
}
