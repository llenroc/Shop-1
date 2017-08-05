using Application.Monitor;
using Castle.Core.Logging;
using Infrastructure.Dependency;
using Infrastructure.Runtime.Session;
using Microsoft.AspNet.SignalR;

namespace Application.WebSite.Hubs
{
    public class SystemHub : Hub, ITransientDependency
    {
        public IInfrastructureSession InfrastructureSession { get; set; }
        public ILogger Logger { get; set; }


        public SystemHub()
        {
            InfrastructureSession = NullInfrastructureSession.Instance;
            Logger = NullLogger.Instance;
        }

        public void GetMonitorInfo()
        {
            MonitorOutput monitorOutput = new MonitorOutput()
            {
                CPUInfo = CPUInfo.GetCPUInfo(),
                MemInfo = MemoryInfo.GetMemInfo(),
                TCPCount = TCPInfo.GetTCPCount(),
                OnlineCount= OnlineInfo.GetOnlineCount()
            };
            Clients.All.getMonitorInfo(monitorOutput);
        }
    }
}