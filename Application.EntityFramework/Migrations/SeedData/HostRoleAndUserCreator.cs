using System.Linq;
using Infrastructure.Authorization;
using Infrastructure.Authorization.Roles;
using Infrastructure.Authorization.Users;
using Infrastructure.MultiTenancy;
using Application.Authorization;
using Application.Authorization.Roles;
using Application.EntityFramework;
using Application.Authorization.Users;
using Microsoft.AspNet.Identity;

namespace Application.Migrations.SeedData
{
    public class HostRoleAndUserCreator
    {
        private readonly ApplicationDbContext _context;

        public HostRoleAndUserCreator(ApplicationDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            CreateHostRoleAndUsers();
        }

        private void CreateHostRoleAndUsers()
        {
            //Admin role for host
            var adminRoleForHost = _context.Roles.FirstOrDefault(r => r.TenantId == null && r.Name == StaticRoleNames.Host.Admin);

            if (adminRoleForHost == null)
            {
                adminRoleForHost = _context.Roles.Add(new Role {
                    Name = StaticRoleNames.Host.Admin,
                    DisplayName = StaticRoleNames.Host.Admin,
                    IsStatic = true });

                _context.SaveChanges();

                //Grant all tenant permissions
                var permissions = PermissionFinder
                    .GetAllPermissions(new ApplicationAuthorizationProvider())
                    .Where(p => p.MultiTenancySides.HasFlag(MultiTenancySides.Host))
                    .ToList();

                foreach (var permission in permissions)
                {
                    _context.Permissions.Add(
                        new RolePermissionSetting
                        {
                            Name = permission.Name,
                            IsGranted = true,
                            RoleId = adminRoleForHost.Id
                        });
                }
                _context.SaveChanges();
            }

            //Admin user for tenancy host
            var adminUserForHost = _context.Users.FirstOrDefault(u => u.TenantId == null && u.UserName == User.AdminUserName);

            if (adminUserForHost == null)
            {
                adminUserForHost = _context.Users.Add(
                    new User
                    {
                        UserName = User.AdminUserName,
                        Name = "System",
                        Surname = "Administrator",
                        NickName= "Administrator",
                        Avatar = User.DefaultAvatar,
                        EmailAddress = "admin@aspnetboilerplate.com",
                        IsEmailConfirmed = true,
                        Source = UserSource.System,
                        Password = new PasswordHasher().HashPassword(User.DefaultPassword)
                    });
                _context.SaveChanges();
                _context.UserRoles.Add(new UserRole(null, adminUserForHost.Id, adminRoleForHost.Id));
                _context.SaveChanges();
            }
        }
    }
}