using Application.Orders.Entities;
using Application.Orders.NumberProviders;
using Application.Wechats;
using Senparc.Weixin.MP.TenPayLibV3;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Application.Pay.PayProviders
{
    public class WechatPayProvider:ApplicationDomainServiceBase, IPayProvider
    {
        public WechatCommonManager WechatCommonManager { get; set; }
        private TenPayV3Info _tenPayV3Info;
        public INumberProvider NumberProvider { get; set; }
        private const string RefundUrl= "https://api.mch.weixin.qq.com/secapi/pay/refund";


        public async Task<TenPayV3Info> GetTenPayV3Info()
        {
            if (_tenPayV3Info == null)
            {
                _tenPayV3Info =await WechatCommonManager.GetTenPayV3InfoAsync(InfrastructureSession.TenantId.Value, null);
            }
            return _tenPayV3Info;
        }

        public async Task Refund(Order order, decimal refundFee)
        {
            TenPayV3Info TenPayV3Info =await GetTenPayV3Info();
            string nonceStr = TenPayV3Util.GetNoncestr();
            RequestHandler packageReqHandler = new RequestHandler(null);

            //设置package订单参数
            packageReqHandler.SetParameter("appid", TenPayV3Info.AppId);		  //公众账号ID
            packageReqHandler.SetParameter("mch_id", TenPayV3Info.MchId);		  //商户号
            packageReqHandler.SetParameter("out_trade_no", order.Number);                 //填入商家订单号
            packageReqHandler.SetParameter("out_refund_no", NumberProvider.BuildNumber());                //填入退款订单号
            packageReqHandler.SetParameter("total_fee",(order.PayMoney*100).ToString());               //填入总金额
            packageReqHandler.SetParameter("refund_fee", (refundFee*100).ToString());               //填入退款金额
            packageReqHandler.SetParameter("op_user_id", TenPayV3Info.MchId);   //操作员Id，默认就是商户号
            packageReqHandler.SetParameter("nonce_str", nonceStr);              //随机字符串
            string sign = packageReqHandler.CreateMd5Sign("key", TenPayV3Info.Key);
            packageReqHandler.SetParameter("sign", sign);	                    //签名
            //退款需要post的数据
            string data = packageReqHandler.ParseXML();

            //本地或者服务器的证书位置（证书在微信支付申请成功发来的通知邮件中）
            string cert = @"C:\apiclient_cert.p12";
            //私钥（在安装证书时设置）
            string password = "";
            ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
            //调用证书
            X509Certificate2 cer = new X509Certificate2(cert, password, X509KeyStorageFlags.PersistKeySet | X509KeyStorageFlags.MachineKeySet);

            #region 发起post请求
            HttpWebRequest webrequest = (HttpWebRequest)HttpWebRequest.Create(RefundUrl);
            webrequest.ClientCertificates.Add(cer);
            webrequest.Method = "post";

            byte[] postdatabyte = Encoding.UTF8.GetBytes(data);
            webrequest.ContentLength = postdatabyte.Length;
            Stream stream;
            stream = webrequest.GetRequestStream();
            stream.Write(postdatabyte, 0, postdatabyte.Length);
            stream.Close();

            HttpWebResponse httpWebResponse = (HttpWebResponse)webrequest.GetResponse();
            StreamReader streamReader = new StreamReader(httpWebResponse.GetResponseStream());
            string responseContent = streamReader.ReadToEnd();
            #endregion
        }

        private bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            if (errors == SslPolicyErrors.None)
                return true;

            return false;
        }
    }
}
