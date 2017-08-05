using Application.Authorization.End.Permissions.Dto;
using System.Collections.Generic;

namespace Application.Authorization.End.Roles.Dto
{
    public class RoleForEditDto
    {
        public RoleEditDto Role { get; set; }

        public List<FlatPermissionDto> Permissions { get; set; }

        public List<string> GrantedPermissionNames { get; set; }
    }
}
