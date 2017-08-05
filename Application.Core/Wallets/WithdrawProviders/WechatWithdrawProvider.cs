using Application.Configuration;
using Application.Wallets.Entities;
using Infrastructure.Authorization.Users;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Senparc.Weixin;
using Senparc.Weixin.HttpUtility;
using Senparc.Weixin.MP.TenPayLibV3;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Utility.Net;
using Utility.Web;

namespace Application.Wallets.WithdrawProviders
{
    public class WechatWithdrawProvider: WithdrawProviderBase, IWithdrawProvider
    {
        public IRepository<UserLogin,long> userLoginRepository { get; set; }
        public WithdrawManager WithdrawManager { get; set; }

        public new static PayType PayType { get; set; } = PayType.WeChat;

        /// <summary>
        /// 用于企业向微信用户个人付款 
        /// 目前支持向指定微信用户的openid付款
        /// </summary>
        /// <param name="dataInfo">微信支付需要post的xml数据</param>
        /// <param name="timeOut"></param>
        /// <returns></returns>
        public async Task<TransfersResult> TransfersAsync(int tenantId,TenPayV3TransfersRequestData dataInfo)
        {
            var urlFormat = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
            var data = dataInfo.PackageRequestHandler.ParseXML();
            var formDataBytes = data == null ? new byte[0] : Encoding.UTF8.GetBytes(data);
            MemoryStream memoryStream = new MemoryStream();
            memoryStream.Write(formDataBytes, 0, formDataBytes.Length);
            memoryStream.Seek(0, SeekOrigin.Begin);//设置指针读取位置

            //本地或者服务器的证书位置（证书在微信支付申请成功发来的通知邮件中）
            string cert =await SettingManager.GetSettingValueForTenantAsync(WechatSettings.Pay.SslcertPath,tenantId);
            //私钥（在安装证书时设置）
            string password = dataInfo.MchId;
            ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
            //调用证书
            X509Certificate2 x509Certificate2 = new X509Certificate2(
                PathHelper.GetAbsolutePath(cert), 
                password, 
                X509KeyStorageFlags.PersistKeySet | X509KeyStorageFlags.MachineKeySet);

            string resultXml = RequestUtility.HttpPost(urlFormat, null, memoryStream, null, null, Encoding.UTF8, x509Certificate2, Config.TIME_OUT);
            TransfersResult transfersResult = new TransfersResult(resultXml);
            return transfersResult;
        }

        [UnitOfWork]
        public async Task Withdraw(WithdrawApply withdrawApply)
        {
            using (CurrentUnitOfWork.SetTenantId(withdrawApply.TenantId))
            {
                string appId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, withdrawApply.TenantId);
                string mchId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.Pay.MchId, withdrawApply.TenantId);
                string key = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.Pay.Key, withdrawApply.TenantId);

                UserLogin userLogin = userLoginRepository.GetAll().Where(model => model.UserId == withdrawApply.UserId
                && model.LoginProvider == "Weixin").FirstOrDefault();

                if (userLogin == null)
                {
                    throw new WithdrawException(PayType, L("TheUserHasNoWeixinLogin"));
                }
                string openId = userLogin.ProviderKey;
                string nonce = TenPayV3Util.GetNoncestr();

                TenPayV3TransfersRequestData TenPayV3TransfersRequestData = new TenPayV3TransfersRequestData(
                    appId, 
                    mchId, 
                    null, 
                    nonce,
                    withdrawApply.SerialNumber,
                    openId,
                    key, 
                    "NO_CHECK",
                    null,
                    (int)(withdrawApply.Money),
                    L("Withdraw"), 
                    IPHelper.GetAddressIP());
                TransfersResult transfersResult = await TransfersAsync(withdrawApply.TenantId, TenPayV3TransfersRequestData);

                if (transfersResult.return_code == "FAIL")
                {
                    WithdrawManager.WithdrawNotify(withdrawApply.Id, PayType, false, transfersResult.return_msg);
                }
                bool success = transfersResult.result_code == "FAIL" ? false : true;
                WithdrawManager.WithdrawNotify(withdrawApply.Id, PayType, success, transfersResult.err_code_des);
            }
        }

        private bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }
    }
}
