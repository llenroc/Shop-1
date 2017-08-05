using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.Authorization.End.Permissions.Dto
{
    public interface IPermissionAppService : IApplicationService
    {
        IListResult<FlatPermissionWithLevelDto> GetAllPermissions();
    }
}
