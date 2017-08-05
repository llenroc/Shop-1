using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Friendships.Cache
{
    public class UserWithFriendsCacheItem
    {
        public int? TenantId { get; set; }

        public long UserId { get; set; }

        public string TenancyName { get; set; }

        public string UserName { get; set; }

        public string Avatar { get; set; }

        public List<FriendCacheItem> Friends { get; set; }
    }
}
