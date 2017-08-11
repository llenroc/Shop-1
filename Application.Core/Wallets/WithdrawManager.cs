using Application.Authorization.Users;
using Application.Orders.NumberProviders;
using Application.Shops;
using Application.Wallets.Entities;
using Application.Wallets.WithdrawProviders;
using Application.Wechats;
using Application.Wechats.TemplateMessages;
using Application.Wechats.TemplateMessages.TemplateMessageDatas;
using Infrastructure;
using Infrastructure.Configuration;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Threading.Tasks;
using System.Transactions;

namespace Application.Wallets
{
    public class WithdrawManager:ApplicationDomainServiceBase
    {
        public WalletManager WalletManager { get; set; }
        public IRepository<WithdrawApply> WithdrawApplyRepository { get; set; }
        public IRepository<User, long> UserRepository { get; set; }
        public WechatUserManager WechatUserManager { get; set; }
        public IRepository<WalletRecord> WalletRecordRepository { get; set; }
        public TemplateMessageManager TemplateMessageManager { get; set; }
        public INumberProvider NumberProvider { get; set; }

        [UnitOfWork]
        public async Task<WalletRecord> WithdrawAllBalanceAsync(UserIdentifier userIdentifier)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                decimal usableMoeny = WalletManager.GetUsableMoney(userIdentifier);
                return await WithdrawAsync(userIdentifier, usableMoeny, L("Withdraw"));
            }
        }

        [UnitOfWork]
        public async Task<WalletRecord> WithdrawAsync(UserIdentifier userIdentifier, decimal money, string remark)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant))
            {
                WalletRecord walletRecord = WalletManager.CreateWithdrawWalletRecord(userIdentifier,money,remark);
                WithdrawApply withdrawApply = new WithdrawApply()
                {
                    SerialNumber=NumberProvider.BuildNumber(),
                    WalletRecord = walletRecord,
                    Money = money,
                    Status = WithdrawStatus.Withdrawing,
                    UserId=userIdentifier.UserId
                };
                WithdrawApplyRepository.Insert(withdrawApply);

                bool autoPayForWithdraw = SettingManager.GetSettingValue<bool>(ShopSettings.Distribution.AutoPayForWithdraw);

                if (autoPayForWithdraw)
                {
                    try
                    {
                        await ProcessWithdrawAsync(withdrawApply.Id);
                    }
                    catch
                    {

                    }
                }
                return walletRecord;
            }
        }

        [UnitOfWork]
        public async Task<WithdrawApply> ProcessWithdrawAsync(int withdrawApplyId, WithdrawMethod withdrawMethod = WithdrawMethod.WeixinQiyePay)
        {
            WithdrawApply withdrawApply = WithdrawApplyRepository.Get(withdrawApplyId);
            return await ProcessWithdrawAsync(withdrawApply, withdrawMethod);
        }

        [UnitOfWork]
        public async Task<WithdrawApply> ProcessWithdrawAsync(WithdrawApply withdrawApply, WithdrawMethod withdrawMethod=WithdrawMethod.WeixinQiyePay)
        {
            IWithdrawProvider WithdrawProvider = IocManager.Instance.Resolve<IWithdrawProvider>();

            switch (withdrawMethod)
            {
                case WithdrawMethod.WeixinQiyePay:
                    WithdrawProvider= IocManager.Instance.Resolve<IWithdrawProvider>();
                    break;
                case WithdrawMethod.Manual:
                    WithdrawProvider = IocManager.Instance.Resolve<IWithdrawProvider>();
                    break;
            }

            try
            {
                await WithdrawProvider.Withdraw(withdrawApply);
            }
            catch (WithdrawException exception)
            {
                WithdrawNotify(withdrawApply.Id, exception.PayType, false, exception.Message);
                throw exception;
            }
            return withdrawApply;
        }

        [UnitOfWork]
        public WithdrawApply WithdrawNotify(int withdrawApplyId, PayType payType, bool success, string failReason = null)
        {
            using (_unitOfWorkManager.Begin(TransactionScopeOption.Suppress))
            {
                using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant, DataFilters.MayHaveTenant))
                {
                    WithdrawApply withdrawApply = WithdrawApplyRepository.Get(withdrawApplyId);
                    string openid = WechatUserManager.GetOpenid(withdrawApply.GetUserIdentifier());
                    User user = withdrawApply.User;

                    if (user == null)
                    {
                        user = UserRepository.Get(withdrawApply.UserId);
                    }

                    if (success)
                    {
                        withdrawApply.WalletRecord.PayType = payType;
                        withdrawApply.WalletRecord.FetchStatus = FetchStatus.Success;
                        withdrawApply.WalletRecord.FailReason = "";
                        WalletRecordRepository.Update(withdrawApply.WalletRecord);

                        withdrawApply.FailReason = "";
                        withdrawApply.Status = WithdrawStatus.Success;
                        WithdrawApplyRepository.Update(withdrawApply);
                        CurrentUnitOfWork.SaveChanges();

                        if (!string.IsNullOrEmpty(openid))
                        {
                            Task.Run(async () =>
                            {
                                WalletWithdrawTemplateMessageData data = new WalletWithdrawTemplateMessageData(
                                      new TemplateDataItem(L("WithdrawSuccessfully")),
                                      new TemplateDataItem(user.NickName),
                                      new TemplateDataItem((withdrawApply.Money).ToString()),
                                      new TemplateDataItem(L("ThankYouForYourPatronage"))
                                      );
                                await TemplateMessageManager.SendTemplateMessageOfWalletWithdrawAsync(withdrawApply.TenantId, openid, null, data);
                            });
                        }
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(failReason))
                        {
                            failReason = L("UnKnowFail");
                        }
                        withdrawApply.WalletRecord.FetchStatus = FetchStatus.Fail;
                        withdrawApply.WalletRecord.FailReason = failReason;
                        WalletRecordRepository.Update(withdrawApply.WalletRecord);

                        withdrawApply.FailReason = failReason;
                        withdrawApply.Status = WithdrawStatus.Fail;
                        WithdrawApplyRepository.Update(withdrawApply);
                        CurrentUnitOfWork.SaveChanges();

                        if (!string.IsNullOrEmpty(openid))
                        {
                            Task.Run(async () =>
                            {
                                WalletWithdrawTemplateMessageData data = new WalletWithdrawTemplateMessageData(
                                      new TemplateDataItem(L("WithdrawFailed") + ":" + failReason),
                                      new TemplateDataItem(user.NickName),
                                      new TemplateDataItem((withdrawApply.Money).ToString()),
                                      new TemplateDataItem(L("ThankYouForYourPatronage"))
                                      );
                                await TemplateMessageManager.SendTemplateMessageOfWalletWithdrawAsync(withdrawApply.TenantId, openid, null, data);
                            });
                        }
                    }
                    return withdrawApply;
                }
            }
        }
    }
}
