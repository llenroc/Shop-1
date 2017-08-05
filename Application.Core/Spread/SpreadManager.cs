using Application.Authorization.Users;
using Application.Configuration;
using Application.Wechats;
using Application.Wechats.TemplateMessages;
using Application.Wechats.TemplateMessages.TemplateMessageDatas;
using Infrastructure;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.UI;
using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Threading.Tasks;

namespace Application.Spread
{
    public class SpreadManager:ApplicationDomainServiceBase
    {
        public IRepository<User,long> UserRepository { get; set; }
        public TemplateMessageManager TemplateMessageManager { get; set; }

        public async Task CanSpreadAsync(UserIdentifier userIdentifier)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                User user = UserRepository.Get(userIdentifier.UserId);
                await CanSpreadAsync(user);
            }
        }

        public async Task CanSpreadAsync(User user)
        {
            bool mustBeSpreaderForSpread = await SettingManager.GetSettingValueForTenantAsync<bool>(SpreadSettings.General.MustBeSpreaderForSpread, user.TenantId.Value);

            if (mustBeSpreaderForSpread&&!user.IsSpreader)
            {
                throw new UserFriendlyException(L("YouMustBeSpreaderToSpread"));
            }
        }

        public async Task CanGetSpreadPoster(UserIdentifier userIdentifier)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                User user = UserRepository.Get(userIdentifier.UserId);
                await CanGetSpreadPoster(user);
            }
        }

        public async Task CanGetSpreadPoster(User user)
        {
            await CanSpreadAsync(user);
            bool mustBeAgencyToGetSpreadPoster = await SettingManager.GetSettingValueForTenantAsync<bool>(SpreadSettings.General.MustBeAgencyToGetSpreadPoster, user.TenantId.Value);

            if (mustBeAgencyToGetSpreadPoster&&(!user.IsChannelAgency&&!user.IsAreaAgency))
            {
                throw new UserFriendlyException(L("YouMustBeAgencyToGetSpreadPoster"));
            }
        }

        [UnitOfWork]
        public async Task SetAsSpreader(UserIdentifier userIdentifier)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId.Value))
            {
                User user = UserRepository.Get(userIdentifier.UserId);
                await SetAsSpreader(user);
            }
        }

        [UnitOfWork]
        public async Task SetAsSpreader(User user)
        {
            if (user.IsSpreader)
            {
                return;
            }
            user.IsSpreader = true;
            UserRepository.Update(user);

            WechatUserManager wechatUserManager = IocManager.Instance.Resolve<WechatUserManager>();
            string openid = wechatUserManager.GetOpenid(user.ToUserIdentifier());

            if (!String.IsNullOrEmpty(openid))
            {
                try
                {
                    UpgradeTemplateMessageData data = new UpgradeTemplateMessageData(
                        new TemplateDataItem(L("CongratulationsOnBeenSpreader")),
                        new TemplateDataItem(user.Id.ToString()),
                        new TemplateDataItem(L("NoLimit")),
                        new TemplateDataItem(L("ThankYouForYourPatronage"))
                        );
                    await TemplateMessageManager.SendTemplateMessageOfUpgradeAsync(user.TenantId.Value, openid, null, data);
                }
                catch
                {

                }
            }
        }
    }
}
