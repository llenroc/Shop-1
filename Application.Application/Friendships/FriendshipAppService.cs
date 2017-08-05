﻿using Application.Authorization.Users;
using Application.Chat;
using Application.Friendships.Dto;
using Infrastructure;
using Infrastructure.Authorization;
using Infrastructure.AutoMapper;
using Infrastructure.MultiTenancy;
using Infrastructure.RealTime;
using Infrastructure.Runtime.Session;
using Infrastructure.UI;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Friendships
{
    [InfrastructureAuthorize]
    public class FriendshipAppService : ApplicationAppServiceBase, IFriendshipAppService
    {
        private readonly IFriendshipManager _friendshipManager;
        private readonly IOnlineClientManager _onlineClientManager;
        private readonly IChatCommunicator _chatCommunicator;
        private readonly ITenantCache _tenantCache;
        private readonly IChatFeatureChecker _chatFeatureChecker;

        public FriendshipAppService(
            IFriendshipManager friendshipManager,
            IOnlineClientManager onlineClientManager,
            IChatCommunicator chatCommunicator,
            ITenantCache tenantCache,
            IChatFeatureChecker chatFeatureChecker)
        {
            _friendshipManager = friendshipManager;
            _onlineClientManager = onlineClientManager;
            _chatCommunicator = chatCommunicator;
            _tenantCache = tenantCache;
            _chatFeatureChecker = chatFeatureChecker;
        }

        public async Task<FriendDto> CreateFriendshipRequest(CreateFriendshipRequestInput input)
        {
            var userIdentifier = InfrastructureSession.ToUserIdentifier();
            var probableFriend = new UserIdentifier(input.TenantId, input.UserId);

            _chatFeatureChecker.CheckChatFeatures(userIdentifier.TenantId, probableFriend.TenantId);

            if (_friendshipManager.GetFriendshipOrNull(userIdentifier, probableFriend) != null)
            {
                throw new UserFriendlyException(L("YouAlreadySentAFriendshipRequestToThisUser"));
            }
            var user = await UserManager.FindByIdAsync(InfrastructureSession.GetUserId());
            User probableFriendUser;

            using (CurrentUnitOfWork.SetTenantId(input.TenantId))
            {
                probableFriendUser = (await UserManager.FindByIdAsync(input.UserId));
            }
            var friendTenancyName = probableFriend.TenantId.HasValue ? _tenantCache.Get(probableFriend.TenantId.Value).TenancyName : null;
            var sourceFriendship = new Friendship(userIdentifier, probableFriend, friendTenancyName, probableFriendUser.UserName, probableFriendUser.Avatar, FriendshipState.Accepted);
            _friendshipManager.CreateFriendship(sourceFriendship);

            var userTenancyName = user.TenantId.HasValue ? _tenantCache.Get(user.TenantId.Value).TenancyName : null;
            var targetFriendship = new Friendship(probableFriend, userIdentifier, userTenancyName, user.UserName, user.Avatar, FriendshipState.Accepted);
            _friendshipManager.CreateFriendship(targetFriendship);

            var clients = _onlineClientManager.GetAllByUserId(probableFriend);

            if (clients.Any())
            {
                var isFriendOnline = _onlineClientManager.IsOnline(sourceFriendship.ToUserIdentifier());
                _chatCommunicator.SendFriendshipRequestToClient(clients, targetFriendship, false, isFriendOnline);
            }
            var senderClients = _onlineClientManager.GetAllByUserId(userIdentifier);

            if (senderClients.Any())
            {
                var isFriendOnline = _onlineClientManager.IsOnline(targetFriendship.ToUserIdentifier());
                _chatCommunicator.SendFriendshipRequestToClient(senderClients, sourceFriendship, true, isFriendOnline);
            }
            var sourceFriendshipRequest = sourceFriendship.MapTo<FriendDto>();
            sourceFriendshipRequest.IsOnline = _onlineClientManager.GetAllByUserId(probableFriend).Any();

            return sourceFriendshipRequest;
        }

        public async Task<FriendDto> CreateFriendshipRequestByUserName(CreateFriendshipRequestByUserNameInput input)
        {
            var probableFriend = await GetUserIdentifier(input.TenancyName, input.UserName);
            return await CreateFriendshipRequest(new CreateFriendshipRequestInput
            {
                TenantId = probableFriend.TenantId,
                UserId = probableFriend.UserId
            });
        }

        public void BlockUser(BlockUserInput input)
        {
            var userIdentifier = InfrastructureSession.ToUserIdentifier();
            var friendIdentifier = new UserIdentifier(input.TenantId, input.UserId);
            _friendshipManager.BanFriend(userIdentifier, friendIdentifier);

            var clients = _onlineClientManager.GetAllByUserId(userIdentifier);

            if (clients.Any())
            {
                _chatCommunicator.SendUserStateChangeToClients(clients, friendIdentifier, FriendshipState.Blocked);
            }
        }

        public void UnblockUser(UnblockUserInput input)
        {
            var userIdentifier = InfrastructureSession.ToUserIdentifier();
            var friendIdentifier = new UserIdentifier(input.TenantId, input.UserId);
            _friendshipManager.AcceptFriendshipRequest(userIdentifier, friendIdentifier);

            var clients = _onlineClientManager.GetAllByUserId(userIdentifier);

            if (clients.Any())
            {
                _chatCommunicator.SendUserStateChangeToClients(clients, friendIdentifier, FriendshipState.Accepted);
            }
        }

        public void AcceptFriendshipRequest(AcceptFriendshipRequestInput input)
        {
            var userIdentifier = InfrastructureSession.ToUserIdentifier();
            var friendIdentifier = new UserIdentifier(input.TenantId, input.UserId);
            _friendshipManager.AcceptFriendshipRequest(userIdentifier, friendIdentifier);

            var clients = _onlineClientManager.GetAllByUserId(userIdentifier);

            if (clients.Any())
            {
                _chatCommunicator.SendUserStateChangeToClients(clients, friendIdentifier, FriendshipState.Blocked);
            }
        }

        private async Task<UserIdentifier> GetUserIdentifier(string tenancyName, string userName)
        {
            int? tenantId = null;

            if (!tenancyName.Equals("."))
            {
                using (CurrentUnitOfWork.SetTenantId(null))
                {
                    var tenant = await TenantManager.FindByTenancyNameAsync(tenancyName);

                    if (tenant == null)
                    {
                        throw new UserFriendlyException("There is no such tenant !");
                    }
                    tenantId = tenant.Id;
                }
            }

            using (CurrentUnitOfWork.SetTenantId(tenantId))
            {
                var user = await UserManager.FindByNameOrEmailAsync(userName);

                if (user == null)
                {
                    throw new UserFriendlyException("There is no such user !");
                }
                return user.ToUserIdentifier();
            }
        }
    }
}
