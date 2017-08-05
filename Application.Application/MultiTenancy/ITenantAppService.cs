using System.Threading.Tasks;
using Infrastructure.Application.Services;
using Infrastructure.Application.DTO;
using Application.MultiTenancy.Dto;

namespace Application.MultiTenancy
{
    public interface ITenantAppService : IApplicationService
    {
        Task<PagedResultDto<TenantListDto>> GetTenants(GetTenantsInput input);

        Task CreateTenant(CreateTenantInput input);

        Task<TenantEditDto> GetTenantForEdit(EntityRequestInput input);

        Task UpdateTenant(TenantEditDto input);

        Task DeleteTenant(EntityRequestInput input);

        Task<GetTenantFeaturesForEditOutput> GetTenantFeaturesForEdit(EntityRequestInput input);

        Task UpdateTenantFeatures(UpdateTenantFeaturesInput input);

        Task ResetTenantSpecificFeatures(EntityRequestInput input);
    }
}
