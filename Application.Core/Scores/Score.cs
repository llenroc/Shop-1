using Application.Authorization.Users;
using Application.Entities;
using Infrastructure;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Scores
{
    public class Score: UserIdentifierEntity
    {
        public int Total { get; set; }

        [ForeignKey("UserId")]
        public virtual User User { get; set; }

        public Score()
        {

        }

        public Score(UserIdentifier userIdentifier):base(userIdentifier)
        {
        }
    }
}
