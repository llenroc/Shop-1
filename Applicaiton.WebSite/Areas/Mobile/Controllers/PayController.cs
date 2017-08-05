using Application.Configuration;
using Application.Orders.Entities;
using Application.Orders.Fronts.Common;
using Application.Orders.Fronts.Dto;
using Infrastructure.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Senparc.Weixin.MP;
using Senparc.Weixin;
using Senparc.Weixin.MP.TenPayLibV3;
using System.Text;
using Application.Orders;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.IO;
using System.Xml.Linq;
using System.Net.Security;
using Application.Wallets.Entities;
using Application.Wechats;
using Infrastructure.UI;
using Infrastructure.Authorization.Users;
using Infrastructure.Domain.UnitOfWork;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class PayController : AuthorizationMobileControllerBase
    {
        protected IOrderAppService _orderAppService;
        protected IRepository<Order> _orderRepository;
        protected IRepository<UserLogin,long> _userLoginRepository;

        public CommonOrderManager OrderManager { get; set; }
        public WechatCommonManager WechatCommonManager { get; set; }
        public WechatUserManager WechatUserManager { get; set; }

        public async Task<TenPayV3Info> GetTenPayV3Info(int tenantId)
        {
            TenPayV3Info tenPayV3Info =await WechatCommonManager.GetTenPayV3InfoAsync(
                tenantId, 
                Url.Action("PayNotify", "Pay", null, Request.Url.Scheme));
            return tenPayV3Info;
        }

        public PayController(
            IOrderAppService orderAppService,
            IRepository<Order> orderRepository,
            IRepository<UserLogin,long> userLoginRepository)
        {
            _orderAppService = orderAppService;
            _orderRepository = orderRepository;
            _userLoginRepository = userLoginRepository;
        }

        public ActionResult Index(PayInput input)
        {
            PayOutput PayOutput = _orderAppService.GetPayOutput(input);
            return View(PayOutput);
        }

        public async Task<JsonResult> GetPaySign(PayInput input)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant, DataFilters.MayHaveTenant))
            {
                Order order = _orderRepository.Get(input.Id);
                TenPayV3Info tenPayV3Info = await GetTenPayV3Info(InfrastructureSession.TenantId.Value);
                string timeStamp = TenPayV3Util.GetTimestamp();
                string nonceStr = TenPayV3Util.GetNoncestr();

                if (order.PrepayIdCreatedTime.HasValue&& order.PrepayIdCreatedTime < DateTime.Now.AddHours(-2))
                {
                    throw new UserFriendlyException(L("TheOrderHasOverTime"));
                }

                if (string.IsNullOrEmpty(order.PrepayId))
                {
                    string body = order.Title;//商品或支付单简要描述
                    string out_trade_no = order.Number;//商户系统内部的订单号，32个字符内，可包含字母，其他说明见商户订单号
                    int totalFee = (int)(order.PayMoney * 100);//订单总金额，只能是整数。
                    string spbill_create_ip = Request.UserHostAddress;//APP和网页支付提交用户端IP，Native支付填调用微信支付API的机器IP

                    string openid = WechatUserManager.GetOpenid(order.User.ToUserIdentifier());
                    TenPayV3UnifiedorderRequestData xmlDataInfo = new TenPayV3UnifiedorderRequestData(
                        tenPayV3Info.AppId,
                        tenPayV3Info.MchId,
                        body,
                        out_trade_no,
                        totalFee,
                        Request.UserHostAddress,
                        tenPayV3Info.TenPayV3Notify,
                        //trade_type=JSAPI,此参数必传，用户在商户appid下的唯一标识。必传，这里需要将去获取openid赋值上去
                        TenPayV3Type.JSAPI,
                        openid,
                        tenPayV3Info.Key,
                        nonceStr);

                    UnifiedorderResult unifiedorderResult = TenPayV3.Unifiedorder(xmlDataInfo, 10000);
                    string prepay_id = unifiedorderResult.prepay_id;
                    order.PrepayId = prepay_id;
                    order.PrepayIdCreatedTime = DateTime.Now;
                    _orderRepository.Update(order);
                }
                nonceStr = TenPayV3Util.GetNoncestr();

                RequestHandler paysignReqHandler = new RequestHandler(null);
                paysignReqHandler.Init();

                //设置支付参数
                paysignReqHandler.SetParameter("appId", tenPayV3Info.AppId);
                paysignReqHandler.SetParameter("timeStamp", timeStamp);
                paysignReqHandler.SetParameter("nonceStr", nonceStr);
                string package = string.Format("prepay_id={0}", order.PrepayId);
                paysignReqHandler.SetParameter("package", package);

                string paySign = TenPayV3.GetJsPaySign(tenPayV3Info.AppId, timeStamp, nonceStr, package, tenPayV3Info.Key);
                paysignReqHandler.SetParameter("paySign", paySign);
                return Json(paysignReqHandler.GetAllParameters());
            }
        }

        [AllowAnonymous]
        public async Task<ContentResult> PayNotify()
        {
            ResponseHandler responseHandler = new ResponseHandler(null);
            string return_code = responseHandler.GetParameter("return_code");
            string return_msg = responseHandler.GetParameter("return_msg");
            string openid = responseHandler.GetParameter("openid");

            using (CurrentUnitOfWork.DisableFilter(DataFilters.MayHaveTenant))
            {
                UserLogin userLogin=_userLoginRepository.GetAll().Where(model => model.ProviderKey == openid).FirstOrDefault();
                TenPayV3Info tenPayV3Info = await GetTenPayV3Info(userLogin.TenantId.Value);
                responseHandler.SetKey(tenPayV3Info.Key);
            }
            
            //验证请求是否从微信发过来（安全）
            if (responseHandler.IsTenpaySign())
            {
                if(return_code== "SUCCESS")
                {
                    string result_code= responseHandler.GetParameter("result_code");

                    if(result_code == "SUCCESS")
                    {
                        string out_trade_no = responseHandler.GetParameter("out_trade_no");

                        using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant, DataFilters.MayHaveTenant))
                        {
                            Order order = _orderRepository.GetAll().Where(model => model.Number == out_trade_no).FirstOrDefault();

                            if (order.PaymentStatus == PaymentStatus.ToPay)
                            {
                                await OrderManager.PayCallback(order, PayType.WeChat);
                            }   
                        }
                    }
                }
            }
            string xml = string.Format(
                @"<xml><return_code><![CDATA[{0}]]></return_code><return_msg><![CDATA[{1}]]></return_msg></xml>", 
                return_code, 
                return_msg);
            return Content(xml, "text/xml");
        }

        /// <summary>
        /// 退款申请接口
        /// </summary>
        /// <returns></returns>
        public async Task<ActionResult> Refund()
        {
            string nonceStr = TenPayV3Util.GetNoncestr();
            RequestHandler packageReqHandler = new RequestHandler(null);
            TenPayV3Info TenPayV3Info = await GetTenPayV3Info(InfrastructureSession.TenantId.Value);

            //设置package订单参数
            packageReqHandler.SetParameter("appid", TenPayV3Info.AppId);		  //公众账号ID
            packageReqHandler.SetParameter("mch_id", TenPayV3Info.MchId);		  //商户号
            packageReqHandler.SetParameter("out_trade_no", "");                 //填入商家订单号
            packageReqHandler.SetParameter("out_refund_no", "");                //填入退款订单号
            packageReqHandler.SetParameter("total_fee", "");               //填入总金额
            packageReqHandler.SetParameter("refund_fee", "");               //填入退款金额
            packageReqHandler.SetParameter("op_user_id", TenPayV3Info.MchId);   //操作员Id，默认就是商户号
            packageReqHandler.SetParameter("nonce_str", nonceStr);              //随机字符串
            string sign = packageReqHandler.CreateMd5Sign("key", TenPayV3Info.Key);
            packageReqHandler.SetParameter("sign", sign);	                    //签名
            //退款需要post的数据
            string data = packageReqHandler.ParseXML();

            //退款接口地址
            string url = "https://api.mch.weixin.qq.com/secapi/pay/refund";
            //本地或者服务器的证书位置（证书在微信支付申请成功发来的通知邮件中）
            string cert = @"F:\apiclient_cert.p12";
            //私钥（在安装证书时设置）
            string password = "";
            ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
            //调用证书
            X509Certificate2 cer = new X509Certificate2(cert, password, X509KeyStorageFlags.PersistKeySet | X509KeyStorageFlags.MachineKeySet);

            #region 发起post请求
            HttpWebRequest webrequest = (HttpWebRequest)HttpWebRequest.Create(url);
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

            var res = XDocument.Parse(responseContent);
            string openid = res.Element("xml").Element("out_refund_no").Value;

            return Content(openid);
        }

        private static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            if (errors == SslPolicyErrors.None)
                return true;

            return false;
        }
    }
}