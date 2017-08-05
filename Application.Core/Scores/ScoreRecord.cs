using Application.Entities;
using Infrastructure;

namespace Application.Scores
{
    public class ScoreRecord : FullAuditedUserIdentifierEntity
    {
        public ScoreRecord()
        {

        }

        public ScoreRecord(UserIdentifier userIdentifier):base(userIdentifier)
        {

        }

        public int Score { get; set; }

        public string Remark { get; set; }
    }
}
