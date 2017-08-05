using Application.Caching.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Caching
{
    public interface ICachingAppService : IApplicationService
    {
        ListResultDto<CacheDto> GetAllCaches();

        Task ClearCache(string name);

        Task ClearAllCaches();
    }
}
