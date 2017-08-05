using Application.Configuration;
using Application.Wechats.PublicWechats.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.UI;
using Senparc.Weixin.Entities;
using Senparc.Weixin.Exceptions;
using Senparc.Weixin.MP;
using Senparc.Weixin.MP.AdvancedAPIs.Media;
using Senparc.Weixin.MP.CommonAPIs;
using Senparc.Weixin.MP.Containers;
using Senparc.Weixin.MP.Entities;
using Senparc.Weixin.MP.Entities.Menu;
using System.Threading.Tasks;
using System.Web;

namespace Application.Wechats.PublicWechats
{
    public class PublicWechatAppService: ApplicationAppServiceBase,IPublicWechatAppService
    {
        public WechatCommonManager WechatCommonManager { get; set; }

        private async Task<string> GetAccessToken()
        {
            string appId = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId, InfrastructureSession.TenantId.Value);
            string appSecret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, InfrastructureSession.TenantId.Value);
            string accessToken = AccessTokenContainer.TryGetAccessToken(appId, appSecret);
            return accessToken;
        }

        public async Task<string> RefreshAccessToken()
        {
            string accessToken =await WechatCommonManager.RefreshAccessToken();
            return accessToken;
        }

        public async Task<GetMenuResult> GetMenuAsync()
        {
            string appId =await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.AppId,InfrastructureSession.TenantId.Value);
            string appSecret = await SettingManager.GetSettingValueForTenantAsync(WechatSettings.General.Secret, InfrastructureSession.TenantId.Value);
            string accessToken =  AccessTokenContainer.TryGetAccessToken(appId, appSecret);

            try
            {
                GetMenuResult result = CommonApi.GetMenu(accessToken);
                return result;
            }
            catch(WeixinMenuException exception)
            {
                return new GetMenuResult(new ButtonGroup());
                //throw new UserFriendlyException(exception.Message);
            }
        }

        public async Task CreateMenuAsync(MenuCreateInput input)
        {
            var useAddCondidionalApi = input.MenuMatchRule != null && !input.MenuMatchRule.CheckAllNull();
            string accessToken = await GetAccessToken();

            //重新整理按钮信息
            WxJsonResult result = null;
            IButtonGroupBase buttonGroup = null;

            if (useAddCondidionalApi)
            {
                //个性化接口
                buttonGroup = CommonApi.GetMenuFromJsonResult(input.ResultFull, new ConditionalButtonGroup()).menu;

                var addConditionalButtonGroup = buttonGroup as ConditionalButtonGroup;
                addConditionalButtonGroup.matchrule = input.MenuMatchRule;
                result = CommonApi.CreateMenuConditional(accessToken, addConditionalButtonGroup);
            }
            else
            {
                //普通接口
                buttonGroup =CommonApi.GetMenuFromJsonResult(input.ResultFull, new ButtonGroup()).menu;
                result =CommonApi.CreateMenu(accessToken, buttonGroup);
            }
        }

        public async Task DeleteMenu()
        {
            string accessToken = await GetAccessToken();
            var result = CommonApi.DeleteMenu(accessToken);
        }

        public async Task<PagedResultDto<MediaList_News_Item>> GetMediaNews(PagedResultRequestDto input)
        {
            string accessToken = await GetAccessToken();
            MediaList_NewsResult mediaList_NewsResult=Senparc.Weixin.MP.AdvancedAPIs.MediaApi.GetNewsMediaList(accessToken, input.SkipCount, input.PageSize);
            GetMediaCountResultJson getMediaCountResultJson = await Senparc.Weixin.MP.AdvancedAPIs.MediaApi.GetMediaCountAsync(accessToken);

            int totalCount = getMediaCountResultJson.news_count;
            int pageCount = totalCount/input.PageSize;
            return new PagedResultDto<MediaList_News_Item>(totalCount, input.PageIndex, input.PageSize, mediaList_NewsResult.item);
        }

        public async Task<PagedResultDto<MediaList_Others_Item>> GetMediaImages(PagedResultRequestDto input)
        {
            string accessToken = await GetAccessToken();
            MediaList_OthersResult mediaList_OthersResult = Senparc.Weixin.MP.AdvancedAPIs.MediaApi.GetOthersMediaList(accessToken,UploadMediaFileType.image, input.SkipCount, input.PageSize);
            GetMediaCountResultJson getMediaCountResultJson = await Senparc.Weixin.MP.AdvancedAPIs.MediaApi.GetMediaCountAsync(accessToken);

            int totalCount = getMediaCountResultJson.image_count;
            int pageCount = totalCount / input.PageSize;
            return new PagedResultDto<MediaList_Others_Item>(totalCount, input.PageIndex, input.PageSize, mediaList_OthersResult.item);
        }

        public async Task UploadMediaImage(UploadMediaImageInput input)
        {
            string accessToken = await GetAccessToken();
            string path = HttpContext.Current.Server.MapPath(input.Path);
            UploadForeverMediaResult uploadForeverMediaResult =await Senparc.Weixin.MP.AdvancedAPIs.MediaApi.UploadForeverMediaAsync(accessToken, path);
        }
    }
}
