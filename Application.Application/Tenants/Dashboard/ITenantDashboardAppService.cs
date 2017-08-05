using Infrastructure.Application.Services;
using Application.Tenants.Dashboard.Dto;

namespace Application.Tenants.Dashboard
{
    public interface ITenantDashboardAppService : IApplicationService
    {
        DashboardOutput GetDashboardActivity();
    }
}
