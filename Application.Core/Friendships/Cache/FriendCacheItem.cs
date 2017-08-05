using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Friendships.Cache
{
    [AutoMapFrom(typeof(Friendship))]
    public class FriendCacheItem
    {
        public const string CacheName = "AppUserFriendCache";

        public long FriendUserId { get; set; }

        public int? FriendTenantId { get; set; }

        public string FriendUserName { get; set; }

        public string FriendTenancyName { get; set; }

        public string FriendAvatar { get; set; }

        public int UnreadMessageCount { get; set; }

        public FriendshipState State { get; set; }
    }
}
