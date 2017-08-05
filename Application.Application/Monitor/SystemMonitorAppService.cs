//提供各种各样支持 COM 互操作 及平台调用服务的成员。
//System.Diagnostics 命名空间中，该命名空间提供了用于与事件日志、性能计数器和系统进程进行交互的类。您可以在生产应用程序中保持对此监控代码的启用，并在发生问题时查看相关信息。

namespace Application.Monitor
{
    public class SystemMonitorAppService : ApplicationAppServiceBase, ISystemMonitorAppService
    {
        public MonitorOutput GetSystemInfo()
        {
            MonitorOutput monitorOutput = new MonitorOutput()
            {
                //CPUInfo=CPUInfo.GetCPUInfo(),
                MemInfo=MemoryInfo.GetMemInfo(),
                TCPCount=TCPInfo.GetTCPCount()
            };
            return monitorOutput;
        }
    }
}
