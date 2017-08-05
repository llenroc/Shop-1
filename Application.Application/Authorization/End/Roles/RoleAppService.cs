using Application.Authorization.End.Permissions.Dto;
using Application.Authorization.End.Roles.Dto;
using Application.Authorization.Roles;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Authorization;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.IdentityFramework;
using Microsoft.AspNet.Identity;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Authorization.End.Roles
{
    /* THIS IS JUST A SAMPLE. */
    public class RoleAppService :CrudAppService<Role,RoleDto>,IRoleAppService
    {
        private readonly RoleManager _roleManager;

        public RoleAppService(IRepository<Role> roleRepository,RoleManager roleManager):base(roleRepository)
        {
            _roleManager = roleManager;
        }

        public async Task UpdateRolePermissions(UpdateRolePermissionsInput input)
        {
            var role = await _roleManager.GetRoleByIdAsync(input.RoleId);
            var grantedPermissions =PermissionManager
                .GetAllPermissions()
                .Where(p => input.GrantedPermissionNames.Contains(p.Name))
                .ToList();

            await _roleManager.SetGrantedPermissionsAsync(role, grantedPermissions);
        }

        public async Task<RoleForEditDto> GetRoleForEdit(NullableIdDto input)
        {
            var permissions = PermissionManager.GetAllPermissions();
            var grantedPermissions = new Permission[0];
            RoleEditDto roleEditDto;

            if (input.Id.HasValue) //Editing existing role?
            {
                var role = await _roleManager.GetRoleByIdAsync(input.Id.Value);
                grantedPermissions = (await _roleManager.GetGrantedPermissionsAsync(role)).ToArray();
                roleEditDto = role.MapTo<RoleEditDto>();
            }
            else
            {
                roleEditDto = new RoleEditDto();
            }

            return new RoleForEditDto
            {
                Role = roleEditDto,
                Permissions = permissions.MapTo<List<FlatPermissionDto>>().OrderBy(p => p.DisplayName).ToList(),
                GrantedPermissionNames = grantedPermissions.Select(p => p.Name).ToList()
            };
        }

        public async Task CreateOrUpdateRole(CreateOrUpdateRoleInput input)
        {
            if (input.Role.Id.HasValue)
            {
                await UpdateRoleAsync(input);
            }
            else
            {
                await CreateRoleAsync(input);
            }
        }

        protected virtual async Task UpdateRoleAsync(CreateOrUpdateRoleInput input)
        {
            var entity = await _roleManager.GetRoleByIdAsync(input.Role.Id.Value);
            ObjectMapper.Map(input.Role, entity);
            CurrentUnitOfWork.SaveChanges();
            await UpdateGrantedPermissionsAsync(entity, input.GrantedPermissionNames);
        }

        protected virtual async Task CreateRoleAsync(CreateOrUpdateRoleInput input)
        {
            var role = new Role(InfrastructureSession.TenantId, input.Role.DisplayName) { IsDefault = input.Role.IsDefault };
            CheckErrors(await _roleManager.CreateAsync(role));
            await CurrentUnitOfWork.SaveChangesAsync(); //It's done to get Id of the role.
            await UpdateGrantedPermissionsAsync(role, input.GrantedPermissionNames);
        }

        protected virtual void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }

        private async Task UpdateGrantedPermissionsAsync(Role role, List<string> grantedPermissionNames)
        {
            var grantedPermissions = PermissionManager.GetPermissionsFromNamesByValidating(grantedPermissionNames);
            await _roleManager.SetGrantedPermissionsAsync(role, grantedPermissions);
        }

        public async Task DeleteRole(EntityRequestInput input)
        {
            var role = await _roleManager.GetRoleByIdAsync(input.Id);
            CheckErrors(await _roleManager.DeleteAsync(role));
        }
    }
}