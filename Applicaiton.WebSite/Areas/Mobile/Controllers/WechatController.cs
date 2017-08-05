using Application.Configuration;
using Application.MultiTenancy;
using Application.WebSite.MultiTenancy;
using Application.WebSite.Wechat.MessageHandles;
using Infrastructure.Threading;
using Senparc.Weixin.Entities;
using Senparc.Weixin.MP;
using Senparc.Weixin.MP.Entities.Request;
using Senparc.Weixin.MP.MvcExtension;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class WechatController : AnonymousMobileControllerBase
    {
        [HttpGet]
        [ActionName("Index")]
        public Task<ActionResult> Get(string signature, string timestamp, string nonce, string echostr)
        {
            Tenant tenant = TenantHelper.GetTenant();
            string Token="";

            AsyncHelper.RunSync(async () =>
            {
                string EncodingAESKey = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.EncodingAESKey, tenant.Id);
                string AppId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, tenant.Id);
                Token = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Token, tenant.Id);
            });

            return Task.Factory.StartNew(() =>
            {
                if (CheckSignature.Check(signature, timestamp, nonce, Token))
                {
                    return echostr; //返回随机字符串则表示验证通过
                }
                else
                {
                    return "failed:" + signature + "," + CheckSignature.GetSignature(timestamp, nonce, Token) + "。" +
                        "如果你在浏览器中看到这句话，说明此地址可以被作为微信公众账号后台的Url，请注意保持Token一致。";
                }
            }).ContinueWith<ActionResult>(task => Content(task.Result));
        }

        /// <summary>
        /// 最简化的处理流程
        /// </summary>
        [HttpPost]
        [ActionName("Index")]
        public ActionResult Post(PostModel postModel)
        {
            Tenant tenant = TenantHelper.GetTenant();
            AsyncHelper.RunSync(async () =>
            {
                string EncodingAESKey = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.EncodingAESKey, tenant.Id);
                string AppId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, tenant.Id);
                string Token = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Token, tenant.Id);

                postModel.Token = Token;
                postModel.EncodingAESKey = EncodingAESKey;
                postModel.AppId = AppId;
            });

            if (!CheckSignature.Check(postModel.Signature, postModel.Timestamp, postModel.Nonce, postModel.Token))
            {
                return new WeixinResult("参数错误！");
            }

            //执行微信处理过程
            var messageHandler = new CustomMessageHandler(Request.InputStream, postModel, tenant);
            messageHandler.OmitRepeatedMessage = true;//启用消息去重功能
            messageHandler.Execute();
            return new WeixinResult("success");
        }
    }
}