using Infrastructure.Domain.Repositories;
using Infrastructure.Runtime.Caching;
using System.Linq;

namespace Application.Expresses
{
    public class FreightTemplateManager:ApplicationDomainServiceBase
    {
        public ICacheManager CacheManager { get; set; }
        public IRepository<FreightTemplate> FreightTemplateRepository { get; set; }

        public FreightTemplate GetFreightTemplate(int id)
        {
            //从缓存中获取
            return CacheManager
                    .GetCache("FreightTemplate")
                    .Get(id.ToString(), () => GetFreightTemplateFromDatabase(id)) as FreightTemplate;
        }

        public FreightTemplate GetFreightTemplateFromDatabase(int id)
        {
            return FreightTemplateRepository.GetAllIncluding(model => model.DeliveryAreas).Where(model => model.Id == id).FirstOrDefault();
        }
    }
}
