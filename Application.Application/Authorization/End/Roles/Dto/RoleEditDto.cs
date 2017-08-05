using Application.Authorization.Roles;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Authorization.End.Roles.Dto
{
    [AutoMap(typeof(Role))]
    public class RoleEditDto
    {
        public int? Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string DisplayName { get; set; }

        public bool IsDefault { get; set; }
    }
}
