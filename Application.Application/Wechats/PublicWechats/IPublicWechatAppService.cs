using Application.Wechats.PublicWechats.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Senparc.Weixin.MP.AdvancedAPIs.Media;
using Senparc.Weixin.MP.Entities;
using System.Threading.Tasks;

namespace Application.Wechats.PublicWechats
{
    public interface IPublicWechatAppService : IApplicationService
    {
        Task<GetMenuResult> GetMenuAsync();

        Task<string> RefreshAccessToken();

        Task CreateMenuAsync(MenuCreateInput input);

        Task<PagedResultDto<MediaList_News_Item>> GetMediaNews(PagedResultRequestDto input);

        Task<PagedResultDto<MediaList_Others_Item>> GetMediaImages(PagedResultRequestDto input);

        Task UploadMediaImage(UploadMediaImageInput input);
    }
}
