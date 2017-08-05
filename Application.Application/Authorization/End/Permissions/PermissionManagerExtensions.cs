using Infrastructure.Authorization;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Authorization.End.Permissions.Dto
{
    public static class PermissionManagerExtensions
    {
        /// <summary>
        /// Gets all permissions by names.
        /// Throws <see cref="InfrastructureValidationException"/> if can not find any of the permission names.
        /// </summary>
        public static IEnumerable<Permission> GetPermissionsFromNamesByValidating(this IPermissionManager permissionManager, IEnumerable<string> permissionNames)
        {
            var permissions = new List<Permission>();
            var undefinedPermissionNames = new List<string>();

            foreach (var permissionName in permissionNames)
            {
                var permission = permissionManager.GetPermissionOrNull(permissionName);

                if (permission == null)
                {
                    undefinedPermissionNames.Add(permissionName);
                }
                permissions.Add(permission);
            }

            if (undefinedPermissionNames.Count > 0)
            {
                throw new Infrastructure.Runtime.Validation.ValidationException(string.Format("There are {0} undefined permission names.", undefinedPermissionNames.Count))
                {
                    ValidationErrors = undefinedPermissionNames.ConvertAll(permissionName => new ValidationResult("Undefined permission: " + permissionName))
                };
            }
            return permissions;
        }
    }
}
