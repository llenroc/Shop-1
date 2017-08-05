using Application.MultiTenancy;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using System;
using System.Linq;

namespace Application.WebSite.MultiTenancy
{
    public static class TenantHelper
    {
        private static Tenant _tenant;

        public static Tenant GetTenant()
        {
            if (_tenant != null)
            {
                return _tenant;
            }
            IRepository<Tenant> tenantRepository= IocManager.Instance.Resolve<IRepository<Tenant>>();
            ITenancyNameFinder tenancyNameFinder = IocManager.Instance.Resolve<ITenancyNameFinder>();
            string tenancyName = tenancyNameFinder.GetCurrentTenancyNameOrNull();

            if (String.IsNullOrEmpty(tenancyName))
            {
                return null;
            }
            _tenant = tenantRepository.GetAll().Where(model => model.TenancyName == tenancyName).FirstOrDefault();
            return _tenant;
        }
    }
}