using Application.Entities;
using Application.Orders.Entities;
using Application.Orders.NumberProviders;
using Application.Shops;
using Application.Wallets.Entities;
using Application.Wechats;
using Application.Wechats.TemplateMessages;
using Application.Wechats.TemplateMessages.TemplateMessageDatas;
using Infrastructure;
using Infrastructure.Configuration;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Wallets
{
    public class WalletManager:ApplicationDomainServiceBase
    {
        public IRepository<Wallet> WalletRepository { get; set; }
        public IRepository<WalletRecord> WalletRecordRepository { get; set; }
        public INumberProvider NumberProvider { get; set; }
        public TemplateMessageManager TemplateMessageManager { get; set; }
        public WechatUserManager WechatUserManager { get; set; }

        [UnitOfWork]
        public Wallet GetWalletOfUser(UserIdentifier userIdentifier)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                Wallet wallet = WalletRepository.GetAll().Where(model => model.UserId == userIdentifier.UserId).FirstOrDefault();

                if (wallet == null)
                {
                    wallet = CreateWalletOfUser(userIdentifier);
                }
                return wallet;
            }
        }

        [UnitOfWork]
        private Wallet CreateWalletOfUser(UserIdentifier userIdentifier)
        {
            Wallet wallet = new Wallet()
            {
                UserId= userIdentifier.UserId
            };
            WalletRepository.Insert(wallet);
            unitOfWorkManager.Current.SaveChanges();
            return wallet;
        }

        public decimal GetUsableMoney(UserIdentifier userIdentifier)
        {
            decimal usableMoney = WalletRecordRepository.GetAll().Where(model => model.UserId == userIdentifier.UserId
            &&((model.Money>0&&model.Status == WalletRecordStatus.Actived)||
            (model.Money<0 && model.Status != WalletRecordStatus.Invalid)))
            .Sum(model => model.Money);
            return usableMoney;
        }

        public string CreateFreezeKeyFromOrder(Order order)
        {
            return "order-" + order.Number;
        }

        public List<WalletRecord> GetFreezingWalletRecordsFromOrder(Order order)
        {
            string key = CreateFreezeKeyFromOrder(order);
            return WalletRecordRepository.GetAll().Where(model => model.Status == WalletRecordStatus.Freezing && model.FreezeKey == key).ToList();
        }

        [UnitOfWork]
        public void UnFreezeWalletRecordFromOrder(Order order)
        {
            List<WalletRecord> walletRecords = GetFreezingWalletRecordsFromOrder(order);

            foreach(WalletRecord walletRecord in walletRecords)
            {
                walletRecord.Status = WalletRecordStatus.Actived;
                WalletRecordRepository.Update(walletRecord);
            }
            CurrentUnitOfWork.SaveChanges();
        }

        [UnitOfWork]
        public void RetrieveWalletRecordFromOrder(Order order)
        {
            List<WalletRecord> walletRecords = GetFreezingWalletRecordsFromOrder(order);
            Wallet wallet = GetWalletOfUser(order.GetUserIdentifier());

            foreach (WalletRecord walletRecord in walletRecords)
            {
                walletRecord.Status = WalletRecordStatus.Invalid;
                WalletRecordRepository.Update(walletRecord);
                wallet.Money -= walletRecord.Money;
            }
            CurrentUnitOfWork.SaveChanges();
        }

        [UnitOfWork]
        public async Task<WalletRecord> IncomeOfOrderRebateAsync(UserIdentifier userIdentifier, decimal money, string remark,Order order,bool checkRebateGuarantee=true)
        {
            if (money <= 0)
            {
                throw new Exception(L("TheMoneyMustGreaterThen0"));
            }
            bool rebateGuarantee = SettingManager.GetSettingValue<bool>(ShopSettings.Distribution.RebateGuarantee);
            WalletRecord walletRecord;

            if (checkRebateGuarantee&&rebateGuarantee)
            {
                walletRecord = BuildWalletRecord(WalletRecordType.Recharge, userIdentifier.UserId, money, remark,WalletRecordStatus.Freezing,0, CreateFreezeKeyFromOrder(order));
            }
            else
            {
                walletRecord = BuildWalletRecord(WalletRecordType.Recharge, userIdentifier.UserId, money, remark);
            }
            WalletRecordRepository.Insert(walletRecord);
            Wallet wallet = GetWalletOfUser(userIdentifier);
            wallet.Money +=money;
            WalletRepository.Update(wallet);
            CurrentUnitOfWork.SaveChanges();

            string openid = WechatUserManager.GetOpenid(userIdentifier);

            if (!string.IsNullOrEmpty(openid))
            {
                OrderRebateTemplateMessageData data = new OrderRebateTemplateMessageData(
                    new TemplateDataItem(remark),
                    new TemplateDataItem(order.Number),
                    new TemplateDataItem(order.PayMoney.ToString()),
                    new TemplateDataItem(order.PaymentDatetime.ToString()),
                    new TemplateDataItem(money.ToString()),
                    new TemplateDataItem(L("ThankYouForYourPatronage"))
                    );
                await TemplateMessageManager.SendTemplateMessageOfOrderRebateAsync(order.TenantId, openid, null, data);
            }
            return walletRecord;
        }

        [UnitOfWork]
        public WalletRecord Recharge(UserIdentifier userIdentifier, decimal money,string remark)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                WalletRecord walletRecord = BuildWalletRecord(WalletRecordType.Recharge, userIdentifier.UserId, money, remark);
                WalletRecordRepository.Insert(walletRecord);

                Wallet wallet = GetWalletOfUser(userIdentifier);
                wallet.Money += money;
                WalletRepository.Update(wallet);

                CurrentUnitOfWork.SaveChanges();
                return walletRecord;
            }
        }

        private WalletRecord BuildWalletRecord(WalletRecordType type, long userId, decimal money, string remark,WalletRecordStatus status=WalletRecordStatus.Actived,int freezingLimit=0,string freezeKey=null)
        {
            WalletRecord walletRecord = new WalletRecord(type, userId, money, remark)
            {
                Status=status,
            };

            if(status== WalletRecordStatus.Freezing)
            {
                walletRecord.FreezingLimit = DateTime.Now.AddSeconds(freezingLimit);
                walletRecord.FreezeKey = freezeKey;
            }
            walletRecord.SerialNumber = NumberProvider.BuildNumber();
            return walletRecord;
        }

        [UnitOfWork]
        public WalletRecord CreateWithdrawWalletRecord(UserIdentifier userIdentifier, decimal money, string remark)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant))
            {
                WalletRecord walletRecord = BuildWalletRecord(WalletRecordType.Withdraw, userIdentifier.UserId, -money, remark);
                WalletRecordRepository.Insert(walletRecord);

                Wallet wallet = GetWalletOfUser(userIdentifier);
                wallet.Money -= money;
                WalletRepository.Update(wallet);

                CurrentUnitOfWork.SaveChanges();
                return walletRecord;
            }
        }

        [UnitOfWork]
        public void InvalidWalletRecordsFromOrder(Order order)
        {
            List<WalletRecord> walletRecords = GetFreezingWalletRecordsFromOrder(order);
            InvalidWalletRecords(walletRecords);
            CurrentUnitOfWork.SaveChanges();
        }

        [UnitOfWork]
        public void InvalidWalletRecords(List<WalletRecord> walletRecords)
        {
            foreach(WalletRecord walletRecord in walletRecords)
            {
                InvalidWalletRecord(walletRecord);
            }
        }


        [UnitOfWork]
        public void InvalidWalletRecord(WalletRecord walletRecord)
        {
            walletRecord.Status = WalletRecordStatus.Invalid;
            WalletRecordRepository.Update(walletRecord);

            Wallet wallet = GetWalletOfUser(walletRecord.GetUserIdentifier());
            wallet.Money -= walletRecord.Money;
            WalletRepository.Update(wallet);
            CurrentUnitOfWork.SaveChanges();
        }

        [UnitOfWork]
        public WalletRecord Transaction(UserIdentifier userIdentifier, decimal money, string remark)
        {
            WalletRecord walletRecord = BuildWalletRecord(WalletRecordType.Transaction, userIdentifier.UserId, -money, remark);
            WalletRecordRepository.Insert(walletRecord);
            CurrentUnitOfWork.SaveChanges();
            return walletRecord;
        }

        public decimal GetMoneyOfRecharge(long userId)
        {
            return WalletRecordRepository.GetAll().Where(model => model.Type == WalletRecordType.Recharge
            &&model.UserId==userId).Sum(od => ((decimal?)od.Money)).GetValueOrDefault();
        }

        public decimal GetMoneyOfWithdrawed(long userId)
        {
            return WalletRecordRepository.GetAll().Where(model => model.Type == WalletRecordType.Withdraw 
            && model.FetchStatus == FetchStatus.Success
            &&model.UserId==userId
            ).Sum(od => ((decimal?)od.Money)).GetValueOrDefault();
        }

        public decimal GetMoneyOfFreezing(long userId)
        {
            return WalletRecordRepository.GetAll().Where(model => model.Status==WalletRecordStatus.Freezing
            && model.UserId == userId).Sum(od => ((decimal?)od.Money)).GetValueOrDefault();
        }

        public decimal GetMoneyOfWithdrawing(long userId)
        {
            return WalletRecordRepository.GetAll().Where(model => model.Type == WalletRecordType.Withdraw
            &&model.FetchStatus!=FetchStatus.Success
            && model.UserId == userId).Sum(od => ((decimal?)od.Money)).GetValueOrDefault();
        }

        [UnitOfWork]
        public WalletRecord SetPayStatusOfSuccess(WalletRecord walletRecord)
        {
            walletRecord.PayStatus = PayStatus.Success;
            walletRecord.PayDateTime = DateTime.Now;

            Wallet wallet = GetWalletOfUser(walletRecord.GetUserIdentifier());

            if (walletRecord.Type == WalletRecordType.Recharge)
            {
                wallet.Money += walletRecord.Money;
            }
            WalletRepository.Update(wallet);
            WalletRecordRepository.Update(walletRecord);
            CurrentUnitOfWork.SaveChanges();
            return walletRecord;
        }

        [UnitOfWork]
        public WalletRecord SetPayStatusOfFail(WalletRecord walletRecord,string failReason=null)
        {
            walletRecord.PayStatus = PayStatus.Fail;
            walletRecord.FailReason = failReason;
            WalletRecordRepository.Update(walletRecord);
            CurrentUnitOfWork.SaveChanges();
            return walletRecord;
        }
    }
}