using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.MultiTenancy
{
    /// <summary>
    /// Used to get current tenant id where <see cref="IAbpSession"/> is not usable.
    /// </summary>
    public interface ITenantIdAccessor
    {
        /// <summary>
        /// Gets current tenant id.
        /// Use <see cref="IAbpSession.TenantId"/> wherever possible (if user logged in).
        /// This method tries to get current tenant id even if current user did not log in.
        /// </summary>
        /// <param name="useSession">Set false to skip session usage</param>
        int? GetCurrentTenantIdOrNull(bool useSession = true);
    }
}
