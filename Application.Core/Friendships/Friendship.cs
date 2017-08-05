using Infrastructure;
using Infrastructure.Authorization.Users;
using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using Infrastructure.Timing;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Friendships
{
    public enum FriendshipState
    {
        Accepted = 1,
        Blocked = 2
    }

    [Table("Friendships")]
    public class Friendship : Entity<long>, IHasCreationTime, IMayHaveTenant
    {
        public long UserId { get; set; }

        public int? TenantId { get; set; }

        public long FriendUserId { get; set; }

        public int? FriendTenantId { get; set; }

        [Required]
        [MaxLength(UserBase.MaxUserNameLength)]
        public string FriendUserName { get; set; }

        public string FriendTenancyName { get; set; }

        public string Avatar { get; set; }

        public FriendshipState State { get; set; }

        public DateTime CreationTime { get; set; }

        public Friendship(UserIdentifier user, UserIdentifier probableFriend, string probableFriendTenancyName, string probableFriendUserName, string Avatar, FriendshipState state)
        {
            if (user == null)
            {
                throw new ArgumentNullException(nameof(user));
            }

            if (probableFriend == null)
            {
                throw new ArgumentNullException(nameof(probableFriend));
            }

            if (!Enum.IsDefined(typeof(FriendshipState), state))
            {
                throw new InvalidEnumArgumentException(nameof(state), (int)state, typeof(FriendshipState));
            }

            UserId = user.UserId;
            TenantId = user.TenantId;
            FriendUserId = probableFriend.UserId;
            FriendTenantId = probableFriend.TenantId;
            FriendTenancyName = probableFriendTenancyName;
            FriendUserName = probableFriendUserName;
            State = state;

            CreationTime = Clock.Now;
        }

        protected Friendship()
        {

        }
    }
}
