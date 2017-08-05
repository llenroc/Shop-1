using Infrastructure;

namespace Application.Scores
{
    public interface IScoreManager
    {
        Score GetScore(UserIdentifier userIdentifier);

        void AddScore(UserIdentifier userIdentifier, int score, string remark);
    }
}
