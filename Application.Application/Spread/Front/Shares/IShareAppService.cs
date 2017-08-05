using Application.Spread.Front.Shares.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.Spread.Front.Shares
{
    public interface IShareAppService : ICrudAppService<ShareDto, int, PagedAndSortedResultRequestDto, ShareForCreateInput, ShareDto>
    {
        PreShareOutput GetPreShare();
        ShareDto Share(ShareForCreateInput shareForCreateInput);
    }
}
