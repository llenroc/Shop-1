using Application.Authorization.Roles;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Authorization.End.Roles.Dto
{
    [AutoMapFrom(typeof(Role))]
    public class RoleDto: FullAuditedEntityDto
    {
        public string Name { get; set; }

        public string DisplayName { get; set; }

        public bool IsDefault { get; set; }

        public bool IsStatic { get; set; }
    }
}
