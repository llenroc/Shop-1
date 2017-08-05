using Application.Authorization.Users;
using Application.MultiTenancy;
using Infrastructure.Application.Features;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.MultiTenancy;
using Infrastructure.Runtime.Caching;

namespace Application.Editions
{
    public class FeatureValueStore : CommonFrameFeatureValueStore<Tenant, User>
    {
        public FeatureValueStore(
            ICacheManager cacheManager,
            IRepository<TenantFeatureSetting, long> tenantFeatureSettingRepository,
            IRepository<Tenant> tenantRepository,
            IRepository<EditionFeatureSetting, long> editionFeatureSettingRepository,
            IFeatureManager featureManager,
            IUnitOfWorkManager unitOfWorkManager)
            : base(cacheManager,
                  tenantFeatureSettingRepository,
                  tenantRepository,
                  editionFeatureSettingRepository,
                  featureManager,
                  unitOfWorkManager)
        {
        }
    }
}
