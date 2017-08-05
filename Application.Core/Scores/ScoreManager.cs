using Application.Scores.Events;
using Infrastructure;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Linq;

namespace Application.Scores
{
    public class ScoreManager:ApplicationDomainServiceBase, IScoreManager
    {
        public IRepository<Score> ScoreRespository { get; set; }
        public IRepository<ScoreRecord> ScoreRecordRespository { get; set; }

        private Score CreateScore(UserIdentifier userIdentifier)
        {
            Score score = new Score(userIdentifier)
            {

            };
            ScoreRespository.InsertAndGetId(score);
            return score;
        }

        public int GetOutScore(UserIdentifier userIdentifier)
        {
            return -ScoreRecordRespository.GetAll().Where(model => model.Score < 0).Sum(model => (int?)model.Score) ?? 0;
        }

        public int GetInScore(UserIdentifier userIdentifier)
        {
            return ScoreRecordRespository.GetAll().Where(model => model.Score >0).Sum(model => (int?)model.Score) ?? 0;
        }

        [UnitOfWork]
        public Score GetScore(UserIdentifier userIdentifier)
        {
            Score score=ScoreRespository.GetAll().Where(model => model.UserId == userIdentifier.UserId).FirstOrDefault();

            if (score == null)
            {
                score = CreateScore(userIdentifier);
            }
            return score;
        }

        [UnitOfWork]
        public void AddScore(UserIdentifier userIdentifier,int scoreValue,string remark)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                ScoreRecord scoreRecord = new ScoreRecord(userIdentifier)
                {
                    Score = scoreValue,
                    Remark = remark
                };
                ScoreRecordRespository.Insert(scoreRecord);
                Score score = GetScore(userIdentifier);
                score.Total += scoreValue;
                ScoreRespository.Update(score);
                CurrentUnitOfWork.SaveChanges();

                EventBus.Trigger(new ScoreChangeEventData(scoreRecord, score));
            }
        }

        public void ConsumeScore(UserIdentifier userIdentifier, int scoreValue, string remark)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                ScoreRecord scoreRecord = new ScoreRecord(userIdentifier)
                {
                    Score = -scoreValue,
                    Remark = remark
                };
                ScoreRecordRespository.Insert(scoreRecord);
                Score score = GetScore(userIdentifier);
                score.Total += scoreRecord.Score;
                ScoreRespository.Update(score);
                CurrentUnitOfWork.SaveChanges();

                EventBus.Trigger(new ScoreChangeEventData(scoreRecord, score));
            }
        }
    }
}
