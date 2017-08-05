using Infrastructure.Collections.Extensions;
using Infrastructure.Dependency;
using Infrastructure.RealTime;
using Infrastructure.Runtime.Session;
using System.Linq;

namespace Application.Monitor
{
    public class OnlineInfo
    {
        public static int GetOnlineCount()
        {
            IOnlineClientManager OnlineClientManager = IocManager.Instance.Resolve<IOnlineClientManager>();
            IInfrastructureSession InfrastructureSession = IocManager.Instance.Resolve<IInfrastructureSession>();
            return OnlineClientManager.GetAllClients().WhereIf(InfrastructureSession.TenantId.HasValue, model =>model.TenantId==InfrastructureSession.TenantId).Count();
        }
    }
}
