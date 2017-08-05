using Infrastructure;
using Infrastructure.Domain.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Friendships
{
    public interface IFriendshipManager : IDomainService
    {
        void CreateFriendship(Friendship friendship);

        void UpdateFriendship(Friendship friendship);

        Friendship GetFriendshipOrNull(UserIdentifier user, UserIdentifier probableFriend);

        void BanFriend(UserIdentifier userIdentifier, UserIdentifier probableFriend);

        void AcceptFriendshipRequest(UserIdentifier userIdentifier, UserIdentifier probableFriend);
    }
}
