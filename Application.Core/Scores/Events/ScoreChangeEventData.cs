using Infrastructure.Event.Bus;
using System;

namespace Application.Scores.Events
{
    [Serializable]
    public class ScoreChangeEventData :  EventData
    {
        public ScoreRecord ScoreRecord { get; set; }
        public Score Score { get; set; }

        public ScoreChangeEventData(ScoreRecord scoreRecord, Score score) 
        {
            ScoreRecord = scoreRecord;
            Score = score;
        }
    }
}
