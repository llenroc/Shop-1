using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.BackgroundJob;
using Application.Notifications;
using Application.Wechats.Qrcodes;
using Infrastructure;
using Infrastructure.Authorization.Users;
using Infrastructure.BackgroundJobs;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Notifications;
using Senparc.Weixin.MP.AdvancedAPIs;
using Senparc.Weixin.MP.AdvancedAPIs.User;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Wechats
{
    public class WechatUserManager:ApplicationDomainServiceBase
    {
        public IRepository<UserLogin,long> UserLoginRepository { get; set; }
        public IRepository<Qrcode> QrcodeRepository { get; set; }
        public IRepository<User,long> UserRepository { get; set; }
        public RoleManager RoleManager { get; set; }
        public CustomerServiceMessageHelper CustomerServiceMessageHelper { get; set; }
        public WechatCommonManager WechatCommonManager { get; set; }

        protected UserManager _userManager;
        protected IAppNotifier _appNotifier;
        protected INotificationSubscriptionManager _notificationSubscriptionManager;
        private readonly IBackgroundJobManager _backgroundJobManager;

        public WechatUserManager(
            UserManager userManager,
            IAppNotifier appNotifier,
            INotificationSubscriptionManager notificationSubscriptionManager,
            IBackgroundJobManager backgroundJobManager)
        {
            _userManager = userManager;
            _appNotifier = appNotifier;
            _notificationSubscriptionManager = notificationSubscriptionManager;
            _backgroundJobManager = backgroundJobManager;
        }

        [UnitOfWork]
        public User GetUserFromOpenId(int tenantId, string openId)
        {
            using (CurrentUnitOfWork.SetTenantId(tenantId))
            {
                UserLogin userLogin = UserLoginRepository.GetAll().Where(model => model.ProviderKey == openId).FirstOrDefault();

                if (userLogin == null)
                {
                    return null;
                }
                User user = UserRepository.Get(userLogin.UserId);
                return user;
            }
        }


        [UnitOfWork]
        public string GetOpenid(UserIdentifier userIdentifier)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                UserLogin weixinUserLogin = UserLoginRepository.GetAll().Where(model => model.UserId == userIdentifier.UserId
                && model.LoginProvider == "Weixin").FirstOrDefault();

                if (weixinUserLogin == null)
                {
                    return null;
                }
                return weixinUserLogin.ProviderKey;
            }
        }

        [UnitOfWork]
        public async Task<User> UpdateUserAsync(int tenantId, UserInfoJson userInfoJson)
        {
            using (CurrentUnitOfWork.SetTenantId(tenantId))
            {
                User user = GetUserFromOpenId(tenantId, userInfoJson.openid);
                user.Avatar = userInfoJson.headimgurl;
                user.NickName = userInfoJson.nickname;
                WechatUserInfo wechatUserInfo = new WechatUserInfo(userInfoJson);

                if (user.WechatUserInfo == null)
                {
                    user.WechatUserInfo = wechatUserInfo;
                }
                else
                {
                    user.WechatUserInfo.Sex = wechatUserInfo.Sex;
                    user.WechatUserInfo.City = wechatUserInfo.City;
                    user.WechatUserInfo.Nickame = wechatUserInfo.Nickame;
                    user.WechatUserInfo.HeadimgUrl = wechatUserInfo.HeadimgUrl;
                    user.WechatUserInfo.Subscribe = wechatUserInfo.Subscribe;
                    user.WechatUserInfo.SubscribeTime = wechatUserInfo.SubscribeTime;
                    user.WechatUserInfo.UnionId = wechatUserInfo.UnionId;
                }
                await UserRepository.UpdateAsync(user);
                return user;
            }
        }

        [UnitOfWork]
        public async Task<User> CreateUserWhenSubscribeAsync(int tenantId, UserInfoJson userInfoJson)
        {
            string userName = userInfoJson.openid;
            var user = new User
            {
                UserName= userName,
                TenantId = tenantId,
                Name = "Weixin",
                Surname = userInfoJson.openid,
                NickName= userInfoJson.nickname,
                Avatar = userInfoJson.headimgurl,
                Source=UserSource.WeixinInteraction,
                IsActive = true
            };
            user.WechatUserInfo = new WechatUserInfo(userInfoJson);
            user.Logins = new List<UserLogin>
            {
                new UserLogin
                {
                    TenantId = tenantId,
                    LoginProvider ="Weixin",
                    ProviderKey = userInfoJson.openid
                }
            };
            string password = User.DefaultPassword;
            user.Password = new Microsoft.AspNet.Identity.PasswordHasher().HashPassword(password);

            //Switch to the tenant
            CurrentUnitOfWork.SetTenantId(tenantId);

            //Add default roles
            user.Roles = new List<UserRole>();

            foreach (var defaultRole in RoleManager.Roles.Where(r => r.IsDefault).ToList())
            {
                user.Roles.Add(new UserRole { RoleId = defaultRole.Id });
            }

            //Save user
            await _userManager.CreateAsync(user);
            unitOfWorkManager.Current.SaveChanges();

            //Notifications
            Task.Run(async () =>
            {
                await _notificationSubscriptionManager.SubscribeToAllAvailableNotificationsAsync(user.ToUserIdentifier());
                await _appNotifier.WelcomeToTheApplicationAsync(user);
                await _appNotifier.NewUserRegisteredAsync(user);
            });
            return user;
        }

        [UnitOfWork]
        public void ProcessSceneId(int sceneId,long userId,int tenantId)
        {
            using (CurrentUnitOfWork.SetTenantId(tenantId))
            {
                User user = UserRepository.Get(userId);

                if (user.ParentUserId.HasValue)
                {
                    return;
                }
                Qrcode qrcode = QrcodeRepository.GetAll().Where(model => model.SceneId == sceneId).FirstOrDefault();

                _unitOfWorkManager.Current.Completed += (sender, args) => {

                    if (qrcode != null)
                    {
                        _backgroundJobManager.Enqueue<BindParentJob, BindParentJobArgs>(new BindParentJobArgs() {
                            SourceUserId = user.Id, ParentUserId = qrcode.UserId
                        });
                    }
                };
            }
        }

        [UnitOfWork]
        public async Task RefreshWeixinUserInfo(long userId)
        {
            User user = UserRepository.Get(userId);
            string openid = GetOpenid(user.ToUserIdentifier());

            string accessToken =await WechatCommonManager.GetAccessTokenAsync();
            UserInfoJson userInfoJson = UserApi.Info(accessToken, openid);
            user.Avatar = userInfoJson.headimgurl;
            user.NickName = userInfoJson.nickname;
            UserRepository.Update(user);
        }
    }
}
