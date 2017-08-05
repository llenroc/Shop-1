using Application.Configuration;
using Application.Wechats.TemplateMessages.TemplateMessageDatas;
using Senparc.Weixin.CommonAPIs;
using Senparc.Weixin.Entities;
using Senparc.Weixin.MP.AdvancedAPIs;
using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.TemplateMessages
{
    public class TemplateMessageManager:ApplicationDomainServiceBase
    {
        public WechatCommonManager WechatCommonManager { get; set; }

        public async Task<SendTemplateMessageResult> SendTemplateMessageAsync<T>(string accessToken, string openId, string templateId,string url, T data) 
            where T:TemplateMessageData
        {
            try
            {
                SendTemplateMessageResult sendResult = await Task.Run(() =>
                {
                    return TemplateApi.SendTemplateMessage(accessToken, openId, templateId, url, data, 5000);
                });
                return sendResult;
            }
            catch
            {
                return null;
            }
        }

        public async Task<SendTemplateMessageResult> SendTemplateMessageOfNewCustomerAsync(int tenantId,string openId,string url, NewCustomerTemplateMessageData data)
        {
            string accessToken =await WechatCommonManager.GetAccessTokenAsync(tenantId);
            string templateId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.NewCustomer, tenantId);
            SendTemplateMessageResult sendResult = await SendTemplateMessageAsync(accessToken,openId,templateId,url,data);
            return sendResult;
        }

        public async Task<SendTemplateMessageResult> SendTemplateMessageOfOrderCreatedAsync(int tenantId, string openId, string url, OrderCreatedTemplateMessageData data)
        {
            string accessToken = await WechatCommonManager.GetAccessTokenAsync(tenantId);
            string templateId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.OrderCreated, tenantId);
            SendTemplateMessageResult sendResult = await SendTemplateMessageAsync(accessToken, openId, templateId, url, data);
            return sendResult;
        }

        public async Task<SendTemplateMessageResult> SendTemplateMessageOfOrderPayedAsync(int tenantId, string openId, string url, OrderPayedTemplateMessageData data)
        {
            string accessToken = await WechatCommonManager.GetAccessTokenAsync(tenantId);
            string templateId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.OrderPayed, tenantId);
            SendTemplateMessageResult sendResult = await SendTemplateMessageAsync(accessToken, openId, templateId, url, data);
            return sendResult;
        }

        public async Task<SendTemplateMessageResult> SendTemplateMessageOfOrderShipedAsync(int tenantId, string openId, string url, OrderShipedTemplateMessageData data)
        {
            string accessToken = await WechatCommonManager.GetAccessTokenAsync(tenantId);
            string templateId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.OrderShiped, tenantId);
            SendTemplateMessageResult sendResult = await SendTemplateMessageAsync(accessToken, openId, templateId, url, data);
            return sendResult;
        }

        public async Task<SendTemplateMessageResult> SendTemplateMessageOfOrderRebateAsync(int tenantId, string openId, string url, OrderRebateTemplateMessageData data)
        {
            string accessToken = await WechatCommonManager.GetAccessTokenAsync(tenantId);
            string templateId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.OrderRebate, tenantId);
            SendTemplateMessageResult sendResult = await SendTemplateMessageAsync(accessToken, openId, templateId, url, data);
            return sendResult;
        }

        public async Task<SendTemplateMessageResult> SendTemplateMessageOfWalletWithdrawAsync(int tenantId, string openId, string url, WalletWithdrawTemplateMessageData data)
        {
            string accessToken = await WechatCommonManager.GetAccessTokenAsync(tenantId);
            string templateId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.WalletWithdraw, tenantId);
            SendTemplateMessageResult sendResult = await SendTemplateMessageAsync(accessToken, openId, templateId, url, data);
            return sendResult;
        }

        public async Task<SendTemplateMessageResult> SendTemplateMessageOfUpgradeAsync(int tenantId, string openId, string url, UpgradeTemplateMessageData data)
        {
            string accessToken = await WechatCommonManager.GetAccessTokenAsync(tenantId);
            string templateId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.TemplateMessage.Upgrade, tenantId);
            SendTemplateMessageResult sendResult = await SendTemplateMessageAsync(accessToken, openId, templateId, url, data);
            return sendResult;
        }
    }
}
