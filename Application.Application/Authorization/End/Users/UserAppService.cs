using Application.Authorization.End.Permissions.Dto;
using Application.Authorization.End.Users.Dto;
using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.BackgroundJob;
using Application.Wechats;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Authorization;
using Infrastructure.Authorization.Users;
using Infrastructure.AutoMapper;
using Infrastructure.BackgroundJobs;
using Infrastructure.Domain.Repositories;
using Infrastructure.Extensions;
using Infrastructure.IdentityFramework;
using Infrastructure.Linq.Extensions;
using Infrastructure.Net.Mail;
using Infrastructure.Runtime.Session;
using Infrastructure.UI;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Application.Authorization.End.Users
{
    [InfrastructureAuthorize(AppPermissions.PagesAdministrationCommon)]
    public class UserAppService 
        :CrudAppService<User,UserListDto,long,UserGetAllInput,CreateUserInput,UpdateUserInput>,
        IUserAppService
    {
        public RoleManager RoleManager { get; set; }
        public UserManager UserManager { get; set; }
        public WechatUserManager WechatUserManager { get; set; }
        public IRepository<UserLocation> UserLocationRepository { get; set; }

        private readonly IPermissionManager _permissionManager;
        private readonly IEmailSender _emailSender;
        private readonly IUserEmailer _userEmailer;
        private readonly IBackgroundJobManager _backgroundJobManager;

        public UserAppService(
            IRepository<User, long> userRepository, 
            IPermissionManager permissionManager, 
            IEmailSender emailSender,
            IBackgroundJobManager backgroundJobManager,
            IUserEmailer userEmailer)
            :base(userRepository)
        {
            _permissionManager = permissionManager;
            _emailSender = emailSender;
            _userEmailer = userEmailer;
            _backgroundJobManager = backgroundJobManager; 
        }

        public UserListDto GetUserFromUserName(GetUserFromUserNameInput input)
        {
            return Repository.FirstOrDefault(model => model.UserName == input.UserName).MapTo<UserListDto>();
        }

        public List<Location> GetUserLocations()
        {
            var userLocationsQuery = from user in Repository.GetAll()
                                     where user.LastLocation.Latitude > 0 || user.LastLocation.Longitude > 0
                                     select user.LastLocation;
            var result = userLocationsQuery.ToList();
            return result;
        }

        public List<UserSourceStatisticsDto> GetUserStatistics()
        {
            var query = from user in Repository.GetAll()
                        group user by user.Source into userGroup
                        select new UserSourceStatisticsDto()
                        {
                            Count=userGroup.Count(),
                            UserSource=userGroup.Key
                        };
            return query.ToList();
        }

        public async Task BindParent(BindParentInput input)
        {
            User sourceUser = Repository.Get(input.SourceUserId);
            User targetUser = Repository.Get(input.TargetUserId);

            try
            {
                await UserManager.BindParentAsync(sourceUser, targetUser, true);
            }
            catch(Exception e)
            {
                throw new UserFriendlyException(e.Message);
            }
        }

        public async Task RefreshWeixinUserInfo(IdInput input)
        {
            await WechatUserManager.RefreshWeixinUserInfo(input.Id);
        }

        protected override IQueryable<User> CreateFilteredQuery(UserGetAllInput input)
        {
            return Repository.GetAll()
                .WhereIf(input.IsSpreader.HasValue, model => model.IsSpreader == input.IsSpreader)
                .WhereIf(string.IsNullOrEmpty(input.NickName) == false, model => model.NickName == input.NickName)
                .WhereIf(string.IsNullOrEmpty(input.UserName) == false, model => model.UserName == input.UserName)
                .WhereIf(input.UserSource.HasValue, model => model.Source == input.UserSource);
        }

        public async Task<PagedResultDto<UserListDto>> GetUsers(UserGetAllInput input)
        {
            PagedResultDto<UserListDto> pagedResultDto = base.GetAllOfPage(input);
            await FillRoleNames(pagedResultDto);
            return pagedResultDto;
        }

        private async Task FillRoleNames(PagedResultDto<UserListDto> pagedResultDto)
        {
            /* This method is optimized to fill role names to given list. */

            var distinctRoleIds = (
                from userDto in pagedResultDto.Items
                from userRoleDto in userDto.Roles
                select userRoleDto.RoleId
                ).Distinct();

            var roleNames = new Dictionary<int, string>();

            foreach (var roleId in distinctRoleIds)
            {
                roleNames[roleId] = (await RoleManager.GetRoleByIdAsync(roleId)).DisplayName;
            }

            foreach (var userDto in pagedResultDto.Items)
            {
                foreach (var userRoleDto in userDto.Roles)
                {
                    userRoleDto.RoleName = roleNames[userRoleDto.RoleId];
                }
                userDto.Roles = userDto.Roles.OrderBy(r => r.RoleName).ToList();
            }
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationCommon)]
        public async Task<GetUserForEditOutput> GetUserForEdit(GetUserForEditInput input)
        {
            //Getting all available roles
            var userRoleDtos = (await RoleManager.Roles
                .OrderBy(r => r.DisplayName)
                .Select(r => new UserRoleDto
                {
                    RoleId = r.Id,
                    RoleName = r.Name,
                    RoleDisplayName = r.DisplayName
                })
                .ToArrayAsync());

            var output = new GetUserForEditOutput
            {
                Roles = userRoleDtos
            };

            if (!input.Id.HasValue)
            {
                //Creating a new user
                output.User = new UserEditDto {
                    IsActive = true,
                    Password=User.DefaultPassword,
                    ShouldChangePasswordOnNextLogin = true
                };

                if (input.ParentUserId.HasValue)
                {
                    output.User.ParentUserId = input.ParentUserId;
                    output.User.ParentUser = Repository.Get(input.ParentUserId.Value).MapTo<UserParentDto>();
                }

                foreach (var defaultRole in await RoleManager.Roles.Where(r => r.IsDefault).ToListAsync())
                {
                    var defaultUserRole = userRoleDtos.FirstOrDefault(ur => ur.RoleName == defaultRole.Name);

                    if (defaultUserRole != null)
                    {
                        defaultUserRole.IsAssigned = true;
                    }
                }
            }
            else
            {
                //Editing an existing user
                var user = await UserManager.GetUserByIdAsync(input.Id.Value);
                output.User = user.MapTo<UserEditDto>();

                foreach (var userRoleDto in userRoleDtos)
                {
                    userRoleDto.IsAssigned = await UserManager.IsInRoleAsync(input.Id.Value, userRoleDto.RoleName);
                }
            }
            return output;
        }

        public async Task CreateOrUpdateUser(CreateOrUpdateUserInput input)
        {
            if (input.User.Id.HasValue)
            {
                await UpdateUserAsync(input);
            }
            else
            {
                await CreateUserAsync(input);
            }
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationCommon)]
        protected virtual async Task CreateUserAsync(CreateOrUpdateUserInput input)
        {
            var user = input.User.MapTo<User>(); //Passwords is not mapped (see mapping configuration)
            user.TenantId = InfrastructureSession.TenantId;
            user.ParentUserId = null;

            //Set password
            if (!input.User.Password.IsNullOrEmpty())
            {
                CheckErrors(await UserManager.PasswordValidator.ValidateAsync(input.User.Password));
            }
            else
            {
                input.User.Password = User.CreateRandomPassword();
            }
            user.Password = new PasswordHasher().HashPassword(input.User.Password);
            user.ShouldChangePasswordOnNextLogin = input.User.ShouldChangePasswordOnNextLogin;
            user.Source = UserSource.System;

            //Assign roles
            user.Roles = new Collection<UserRole>();

            foreach (var roleName in input.AssignedRoleNames)
            {
                var role = await RoleManager.GetRoleByNameAsync(roleName);
                user.Roles.Add(new UserRole(InfrastructureSession.TenantId, user.Id, role.Id));
            }
            CheckErrors(await UserManager.CreateAsync(user));
            await CurrentUnitOfWork.SaveChangesAsync(); //To get new user's Id.

            //if (input.User.ParentUserId.HasValue)
            //{
            //    User parentUser = Repository.Get(input.User.ParentUserId.Value);
            //    await UserManager.BindParentAsync(user, parentUser);
            //}

            //Send activation email
            if (input.SendActivationEmail)
            {
                user.SetNewEmailConfirmationCode();
                await _userEmailer.SendEmailActivationLinkAsync(user, input.User.Password);
            }

            _unitOfWorkManager.Current.Completed += (sender, args) => {

                if (input.User.ParentUserId.HasValue)
                {
                    _backgroundJobManager.Enqueue<BindParentJob, BindParentJobArgs>(new BindParentJobArgs() { SourceUserId = user.Id, ParentUserId = input.User.ParentUserId.Value });
                }
            };
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationCommon)]
        protected virtual async Task UpdateUserAsync(CreateOrUpdateUserInput input)
        {
            Debug.Assert(input.User.Id != null, "input.User.Id should be set.");

            var user = await UserManager.FindByIdAsync(input.User.Id.Value);

            //Update user properties
            input.User.MapTo(user); //Passwords is not mapped (see mapping configuration)

            if (input.SetRandomPassword)
            {
                input.User.Password = User.CreateRandomPassword();
            }

            if (!input.User.Password.IsNullOrEmpty())
            {
                CheckErrors(await UserManager.ChangePasswordAsync(user, input.User.Password));
            }

            CheckErrors(await UserManager.UpdateAsync(user));

            //Update roles
            CheckErrors(await UserManager.SetRoles(user, input.AssignedRoleNames));

            if (input.SendActivationEmail)
            {
                user.SetNewEmailConfirmationCode();
                await _userEmailer.SendEmailActivationLinkAsync(user, input.User.Password);
            }
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationCommon)]
        public async Task ResetUserSpecificPermissions(IdInput<long> input)
        {
            var user = await UserManager.GetUserByIdAsync(input.Id);
            await UserManager.ResetAllPermissionsAsync(user);
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationCommon)]
        public async Task UpdateUserPermissions(UpdateUserPermissionsInput input)
        {
            var user = await UserManager.GetUserByIdAsync(input.Id);
            var grantedPermissions = PermissionManager.GetPermissionsFromNamesByValidating(input.GrantedPermissionNames);
            await UserManager.SetGrantedPermissionsAsync(user, grantedPermissions);
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationCommon)]
        public async Task<GetUserPermissionsForEditOutput> GetUserPermissionsForEdit(IdInput<long> input)
        {
            var user = await UserManager.GetUserByIdAsync(input.Id);
            var permissions = PermissionManager.GetAllPermissions();
            var grantedPermissions = await UserManager.GetGrantedPermissionsAsync(user);

            return new GetUserPermissionsForEditOutput
            {
                Permissions = permissions.MapTo<List<FlatPermissionDto>>().OrderBy(p => p.DisplayName).ToList(),
                GrantedPermissionNames = grantedPermissions.Select(p => p.Name).ToList()
            };
        }

        public async Task ProhibitPermission(ProhibitPermissionInput input)
        {
            var user = await UserManager.GetUserByIdAsync(input.UserId);
            var permission = _permissionManager.GetPermission(input.PermissionName);

            await UserManager.ProhibitPermissionAsync(user, permission);
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationCommon)]
        public async Task DeleteUser(IdInput<long> input)
        {
            if (input.Id == InfrastructureSession.GetUserId())
            {
                throw new UserFriendlyException(L("YouCanNotDeleteOwnAccount"));
            }
            var user = await UserManager.GetUserByIdAsync(input.Id);
            CheckErrors(await UserManager.DeleteAsync(user));
        }

        //Example for primitive method parameters.
        public async Task RemoveFromRole(long userId, string roleName)
        {
            CheckErrors(await UserManager.RemoveFromRoleAsync(userId, roleName));
        }

        private void SendConfirmationEmail(User user)
        {
            var mail = new MailMessage();
            mail.To.Add(user.EmailAddress);
            mail.IsBodyHtml = true;
            mail.Subject = "Email confirmation for Taskever";
            mail.SubjectEncoding = Encoding.UTF8;

            var mailBuilder = new StringBuilder();
            mailBuilder.Append(
                @"<!DOCTYPE html>
<html lang=""en"" xmlns=""http://www.w3.org/1999/xhtml"">
<head>
    <meta charset=""utf-8"" />
    <title>{TEXT_HTML_TITLE}</title>
    <style>
        body {
            font-family: Verdana, Geneva, 'DejaVu Sans', sans-serif;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <h3>{TEXT_WELCOME}</h3>
    <p>{TEXT_DESCRIPTION}</p>
    <p>&nbsp;</p>
    <p><a href=""http://www.taskever.com/Account/ConfirmEmail?UserId={USER_ID}&ConfirmationCode={CONFIRMATION_CODE}"">http://www.taskever.com/Account/ConfirmEmail?UserId={USER_ID}&amp;ConfirmationCode={CONFIRMATION_CODE}</a></p>
    <p>&nbsp;</p>
    <p><a href=""http://www.taskever.com"">http://www.taskever.com</a></p>
</body>
</html>");

            mailBuilder.Replace("{TEXT_HTML_TITLE}", "Email confirmation for Taskever");
            mailBuilder.Replace("{TEXT_WELCOME}", "Welcome to Taskever.com!");
            mailBuilder.Replace("{TEXT_DESCRIPTION}","Click the link below to confirm your email address and login to the Taskever.com");
            mailBuilder.Replace("{USER_ID}", user.Id.ToString());
            mailBuilder.Replace("{CONFIRMATION_CODE}", user.EmailConfirmationCode);

            mail.Body = mailBuilder.ToString();
            mail.BodyEncoding = Encoding.UTF8;

            _emailSender.Send(mail);
        }

        protected virtual void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}