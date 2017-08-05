using Application.MultiTenancy;
using Infrastructure.Dependency;
using Infrastructure.MultiTenancy;
using Infrastructure.Runtime.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;

namespace Application.WebSite.MultiTenancy
{
    /// <summary>
    /// Implements <see cref="ITenantIdAccessor"/> to try to get current tenant id
    /// using <see cref="ITenancyNameFinder"/> and using <see cref="HttpContext"/>
    /// </summary>
    public class TenantIdAccessor : ITenantIdAccessor, ISingletonDependency
    {
        private const string HttpContextKey = "CommonFrameCurrentTenantCacheItem";

        private readonly ITenantCache _tenantCache;
        private readonly IIocResolver _iocResolver;

        private int? _currentTenant;
        private readonly Lazy<IInfrastructureSession> _Session;
        private readonly Lazy<ITenancyNameFinder> _tenancyNameFinder;

        private int? CurrentTenantId
        {
            get
            {
                if (HttpContext.Current != null)
                {
                    _currentTenant = HttpContext.Current.Items[HttpContextKey] as int?;
                    return _currentTenant.Value;
                }
                return _currentTenant.Value;
            }

            set
            {
                _currentTenant = value;

                if (HttpContext.Current != null&& _currentTenant.HasValue)
                {
                    HttpContext.Current.Items[HttpContextKey] = _currentTenant.Value;
                }
            }
        }

        public TenantIdAccessor(
            ITenantCache tenantCache,
            IIocResolver iocResolver)
        {
            _tenantCache = tenantCache;
            _iocResolver = iocResolver;

            _Session = new Lazy<IInfrastructureSession>(() => _iocResolver.Resolve<IInfrastructureSession>(), true);
            _tenancyNameFinder = new Lazy<ITenancyNameFinder>(() => _iocResolver.Resolve<ITenancyNameFinder>(), true);
        }

        /// <summary>
        /// Gets current tenant id.
        /// Use <see cref="IAbpSession.TenantId"/> wherever possible (if user logged in).
        /// This method tries to get current tenant id even if current user did not log in.
        /// </summary>
        /// <param name="useSession">Set false to skip session usage</param>
        public int? GetCurrentTenantIdOrNull(bool useSession = true)
        {
            if (useSession)
            {
                return _Session.Value.TenantId;
            }
            return CurrentTenantId;
        }

        /// <summary>
        /// This method is called on request beginning to obtain current tenant id.
        /// </summary>
        public void SetCurrentTenantId()
        {
            var tenancyName = _tenancyNameFinder.Value.GetCurrentTenancyNameOrNull();

            if (tenancyName == null)
            {
                CurrentTenantId = null;
                return;
            }
            CurrentTenantId = _tenantCache.GetOrNull(tenancyName)?.Id;
        }
    }
}