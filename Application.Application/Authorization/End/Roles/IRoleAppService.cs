using Application.Authorization.End.Roles.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Authorization.End.Roles
{
    public interface IRoleAppService : ICrudAppService<RoleDto,int>
    {
        Task UpdateRolePermissions(UpdateRolePermissionsInput input);

        Task<RoleForEditDto> GetRoleForEdit(NullableIdDto input);

        Task CreateOrUpdateRole(CreateOrUpdateRoleInput input);

        Task DeleteRole(EntityRequestInput input);
    }
}
