using Application.Caching.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Runtime.Caching;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Caching
{
    public class CachingAppService : ApplicationAppServiceBase, ICachingAppService
    {
        public ICacheManager CacheManager { get; set; }

        public ListResultDto<CacheDto> GetAllCaches()
        {
            var caches = CacheManager.GetAllCaches()
                .Select(cache => new CacheDto
                {
                    Name = cache.Name
                }).ToList();
            return new ListResultDto<CacheDto>(caches);
        }

        public async Task ClearCache(string name)
        {
            var cache = CacheManager.GetCache(name);
            await cache.ClearAsync();
        }

        public async Task ClearAllCaches()
        {
            var caches = CacheManager.GetAllCaches();

            foreach (var cache in caches)
            {
                await cache.ClearAsync();
            }
        }
    }
}
