using Infrastructure.Authorization;
using Infrastructure.Authorization.Users;
using Infrastructure.Configuration;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.IdentityFramework;
using Infrastructure.Localization;
using Infrastructure.Organizations;
using Infrastructure.Runtime.Caching;
using Application.Authorization.Roles;
using System.Threading.Tasks;
using Infrastructure;
using Infrastructure.Threading;
using System;
using Application.Channel.ChananlAgencys;
using System.Linq;
using Infrastructure.Event.Bus;
using Application.Authorization.Users.Events;
using Application.Channel.ChannelAgencies;
using Application.Spread;
using Microsoft.AspNet.Identity;
using Infrastructure.ObjectMapping;
using System.Data.Entity;

namespace Application.Authorization.Users
{
    public class UserManager : CommonFrameUserManager<Role, User>
    {
        public IObjectMapper ObjectMapper { get; set; }
        private IRepository<User, long> _userRepository;
        private IRepository<ChannelAgency> _channelAgencyRepository;
        private ChannelAgencyManager _channelAgencyManager;
        private IEventBus EventBus;
        private SpreadManager SpreadManager;

        public UserManager(
            UserStore userStore,
            RoleManager roleManager,
            SpreadManager spreadManager,
            ChannelAgencyManager channelAgencyManager,
            IEventBus eventBus,
            IPermissionManager permissionManager,
            IUnitOfWorkManager unitOfWorkManager,
            ICacheManager cacheManager,
            IRepository<User, long> userRepository,
            IRepository<ChannelAgency> channelAgencyRepository,
            IRepository<OrganizationUnit, long> organizationUnitRepository,
            IRepository<UserOrganizationUnit, long> userOrganizationUnitRepository,
            IOrganizationUnitSettings organizationUnitSettings,
            ILocalizationManager localizationManager,
            ISettingManager settingManager,
            IdentityEmailMessageService emailService,
            IUserTokenProviderAccessor userTokenProviderAccessor)
            : base(
                  userStore,
                  roleManager,
                  permissionManager,
                  unitOfWorkManager,
                  cacheManager,
                  organizationUnitRepository,
                  userOrganizationUnitRepository,
                  organizationUnitSettings,
                  localizationManager,
                  emailService,
                  settingManager,
                  userTokenProviderAccessor)
        {
            SpreadManager = spreadManager;
            EventBus = eventBus;
            _channelAgencyRepository = channelAgencyRepository;
            _channelAgencyManager = channelAgencyManager;
            _userRepository = userRepository;

            UserValidator = new UserValidator<User,long>(this)
            {
                AllowOnlyAlphanumericUserNames=false,
                RequireUniqueEmail=false
            };
        }

        private string L(string name)
        {
            return LocalizationManager.GetString(ApplicationConsts.LocalizationSourceName, name);
        }

        public async Task<User> GetUserOrNullAsync(UserIdentifier userIdentifier)
        {
            using (_unitOfWorkManager.Begin())
            {
                using (_unitOfWorkManager.Current.SetTenantId(userIdentifier.TenantId))
                {
                    return await FindByIdAsync(userIdentifier.UserId);
                }
            }
        }

        public User GetUserOrNull(UserIdentifier userIdentifier)
        {
            return AsyncHelper.RunSync(() => GetUserOrNullAsync(userIdentifier));
        }

        public async Task<User> GetUserAsync(UserIdentifier userIdentifier)
        {
            var user = await GetUserOrNullAsync(userIdentifier);

            if (user == null)
            {
                throw new ApplicationException(L("ThereIsNoUser") + userIdentifier);
            }
            return user;
        }

        public User GetUser(UserIdentifier userIdentifier)
        {
            return AsyncHelper.RunSync(() => GetUserAsync(userIdentifier));
        }

        public async Task CheckCanBind(User sourceUser, User parentUser)
        {
            await SpreadManager.CanSpreadAsync(parentUser);

            if (sourceUser.ParentUserId != null)
            {
                throw new InfrastructureException(L("SourceUserHasParent"));
            }

            if (parentUser.ParentUserId == sourceUser.Id)
            {
                throw new InfrastructureException(L("SourceUserIsTargetUserParent"));
            }

            if (sourceUser.Id == parentUser.Id)
            {
                throw new InfrastructureException(L("SourceUserIsTargetUser"));
            }

            if (sourceUser.IsChannelAgency)
            {
                throw new InfrastructureException(L("ChannelAgencyCannotBindParent"));
            }
        }

        [UnitOfWork]
        public async Task BindParentAsync(User sourceUser, User parentUser,bool throwException=false)
        {
            try
            {
                await CheckCanBind(sourceUser, parentUser);
            }
            catch(Exception e)
            {
                if (throwException)
                {
                    throw e;
                }
                return;
            }

            //source
            sourceUser.ParentUserId = parentUser.Id;

            //channelAgency
            if (parentUser.ChannelAgencyId.HasValue)
            {
                sourceUser.ChannelAgencyId = parentUser.ChannelAgencyId;
                sourceUser.ChannelAgentDepth = parentUser.ChannelAgentDepth + 1;

                _channelAgencyManager.AddNewCustomer(sourceUser.ChannelAgencyId.Value, sourceUser.ChannelAgentDepth);
            }
            else if (parentUser.IsChannelAgency)
            {
                sourceUser.ChannelAgencyId = parentUser.UserChannelAgencyId;
                sourceUser.ChannelAgentDepth = 1;

                _channelAgencyManager.AddNewCustomer(sourceUser.ChannelAgencyId.Value, sourceUser.ChannelAgentDepth);
            }
            _userRepository.Update(sourceUser);

            //
            parentUser.ChildCountOfDepth1 += 1;
            parentUser.GroupCount += 1;
            _userRepository.Update(parentUser);

            //
            if (parentUser.ParentUserId.HasValue)
            {
                parentUser.ParentUser.ChildCountOfDepth2 += 1;
                parentUser.ParentUser.GroupCount += 1;
                _userRepository.Update(parentUser.ParentUser);

                if (parentUser.ParentUser.ParentUserId.HasValue)
                {
                    //
                    parentUser.ParentUser.ParentUser.ChildCountOfDepth3 += 1;
                    parentUser.ParentUser.ParentUser.GroupCount += 1;
                    _userRepository.Update(parentUser.ParentUser.ParentUser);
                }
            }
            EventBus.Trigger(new BindParentEventData(sourceUser, parentUser));
        }

        public async Task BindParentAsync(User sourceUser,long parentUserId)
        {
            User parentUser = _userRepository.Get(parentUserId);
            await BindParentAsync(sourceUser, parentUser);
        }

        public User GetParentUserOfDepth(User sourceUser, int depth)
        {
            if (sourceUser.ParentUserId.HasValue)
            {
                if (depth == 1)
                {
                    return sourceUser.ParentUser;
                }
                else
                {
                    depth--;
                    return GetParentUserOfDepth(sourceUser.ParentUser, depth);
                }
            }
            else
            {
                return null;
            }
        }

        public ChannelAgency GetClosestChannelAgency(User user)
        {
            if (user.ChannelAgencyId.HasValue)
            {
                ChannelAgency channelAgency = _channelAgencyRepository.Get(user.ChannelAgencyId.Value);
                return channelAgency;
            }
            else
            {
                return null;
            }
        }

        public int GetRankOfUser(long userId)
        {
            User user = _userRepository.Get(userId);
            return GetRankOfUser(user);
        }

        public int GetRankOfUser(User user)
        {
            int rank=_userRepository.GetAll().Where(model => model.IsHide == false&&model.Sales>user.Sales).Count();
            rank++;
            return rank;
        }

        public void UpdateUserDetail(User user,UserDetailInfo userDetail)
        {

            if (user.UserDetail != null)
            {
                ObjectMapper.Map(userDetail, user.UserDetail);
            }
            else
            {
                user.UserDetail = ObjectMapper.Map<UserDetail>(userDetail);
            }
            _userRepository.Update(user);
        }

        public async Task<User> GetUserByEmail(string emailAddress)
        {
            return await Users.Where(
               u => u.EmailAddress == emailAddress
               ).FirstOrDefaultAsync();
        }
    }
}