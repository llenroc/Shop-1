using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;
using Infrastructure.Authorization;
using Infrastructure.AutoMapper;
using Infrastructure.MultiTenancy;
using Infrastructure.Runtime.Security;
using Application.Authorization;
using Application.Authorization.Roles;
using Application.Editions;
using Application.MultiTenancy.Dto;
using Application.Authorization.Users;
using System.Data.Entity;
using Infrastructure.Linq.Extensions;
using Infrastructure.Extensions;
using Application.Editions.Dto;
using Infrastructure;

namespace Application.MultiTenancy
{
    [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
    public class TenantAppService : ApplicationAppServiceBase, ITenantAppService
    {
        private readonly TenantManager _tenantManager;
        private readonly RoleManager _roleManager;
        private readonly EditionManager _editionManager;
        private readonly IDbMigrator _Migrator;

        public TenantAppService(
            TenantManager tenantManager, 
            RoleManager roleManager, 
            EditionManager editionManager, 
            IDbMigrator dbMigrator)
        {
            _tenantManager = tenantManager;
            _roleManager = roleManager;
            _editionManager = editionManager;
            _Migrator = dbMigrator;
        }


        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
        public async Task<PagedResultDto<TenantListDto>> GetTenants(GetTenantsInput input)
        {
            var query = _tenantManager.Tenants
               .Include(t => t.Edition)
               .WhereIf(!input.Filter.IsNullOrWhiteSpace(),t =>t.Name.Contains(input.Filter) ||t.TenancyName.Contains(input.Filter));

            var count = await query.CountAsync();
            var tenants = await query.Sorting(input.Sorting).PageBy(input).ToListAsync();
            var items = tenants.MapTo<List<TenantListDto>>();
            PagedResultDto<TenantListDto> pagedResultDto =new PagedResultDto<TenantListDto>(count,input.PageIndex,input.PageSize,items);
            return pagedResultDto;
        }


        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
        public async Task CreateTenant(CreateTenantInput input)
        {
            await _tenantManager.CreateWithAdminUserAsync(input.TenancyName,
               input.Name,
               input.AdminPassword,
               input.AdminEmailAddress,
               input.ConnectionString,
               input.IsActive,
               input.EditionId,
               input.ShouldChangePasswordOnNextLogin,
               input.SendActivationEmail);
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
        public async Task<TenantEditDto> GetTenantForEdit(EntityRequestInput input)
        {
            var tenantEditDto = (await TenantManager.GetByIdAsync(input.Id)).MapTo<TenantEditDto>();
            tenantEditDto.ConnectionString = SimpleStringCipher.Instance.Decrypt(tenantEditDto.ConnectionString);
            return tenantEditDto;
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
        public async Task UpdateTenant(TenantEditDto input)
        {
            input.ConnectionString = SimpleStringCipher.Instance.Encrypt(input.ConnectionString);
            var tenant = await TenantManager.GetByIdAsync(input.Id);
            input.MapTo(tenant);
            CheckErrors(await TenantManager.UpdateAsync(tenant));
        }


        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
        public async Task DeleteTenant(EntityRequestInput input)
        {
            var tenant = await TenantManager.GetByIdAsync(input.Id);
            CheckErrors(await TenantManager.DeleteAsync(tenant));
        }


        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
        public async Task<GetTenantFeaturesForEditOutput> GetTenantFeaturesForEdit(EntityRequestInput input)
        {
            var features = FeatureManager.GetAll();
            var featureValues = await TenantManager.GetFeatureValuesAsync(input.Id);

            return new GetTenantFeaturesForEditOutput
            {
                Features = features.MapTo<List<FlatFeatureDto>>().OrderBy(f => f.DisplayName).ToList(),
                FeatureValues = featureValues.Select(fv => new NameValueDto(fv)).ToList()
            };
        }


        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
        public async Task UpdateTenantFeatures(UpdateTenantFeaturesInput input)
        {
            await TenantManager.SetFeatureValuesAsync(input.Id, input.FeatureValues.Select(fv => new NameValue(fv.Name, fv.Value)).ToArray());
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostTenants)]
        public async Task ResetTenantSpecificFeatures(EntityRequestInput input)
        {
            await TenantManager.ResetAllFeaturesAsync(input.Id);
        }
    }
}