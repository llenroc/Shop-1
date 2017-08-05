using Infrastructure.Application.Services;

namespace Application.Monitor
{
    public interface ISystemMonitorAppService:IApplicationService
    {
        MonitorOutput GetSystemInfo();
    }
}
