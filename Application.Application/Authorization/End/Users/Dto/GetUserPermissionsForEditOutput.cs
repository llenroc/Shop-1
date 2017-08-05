using Application.Authorization.End.Permissions.Dto;
using System.Collections.Generic;

namespace Application.Authorization.End.Users.Dto
{
    public class GetUserPermissionsForEditOutput
    {
        public List<FlatPermissionDto> Permissions { get; set; }

        public List<string> GrantedPermissionNames { get; set; }
    }
}
