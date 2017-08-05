using Infrastructure.Application.Features;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.MultiTenancy;
using Infrastructure.Runtime.Caching;
using Application.MultiTenancy;
using Application.Authorization.Users;

namespace Application.Features
{
    public class FeatureValueStore : CommonFrameFeatureValueStore<Tenant, User>
    {
        public FeatureValueStore(
            ICacheManager cacheManager, 
            IRepository<TenantFeatureSetting, long> tenantFeatureRepository, 
            IRepository<Tenant> tenantRepository, 
            IRepository<EditionFeatureSetting, long> editionFeatureRepository, 
            IFeatureManager featureManager, 
            IUnitOfWorkManager unitOfWorkManager) 
            : base(cacheManager, 
                  tenantFeatureRepository, 
                  tenantRepository, 
                  editionFeatureRepository, 
                  featureManager, 
                  unitOfWorkManager)
        {
        }
    }
}