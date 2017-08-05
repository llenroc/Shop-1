using Application.Authorization.Users;
using Infrastructure.Application.DTO;
using Infrastructure.Authorization.Users;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;

namespace Application.Authorization.End.Users.Dto
{
    [AutoMapFrom(typeof(User))]
    public class UserListDto : EntityDto<long>
    {
        public UserParentDto ParentUser { get; set; }

        public string Name { get; set; }

        public string Surname { get; set; }

        public string UserName { get; set; }

        public string FullName { get; set; }

        public string NickName { get; set; }

        public UserSource Source { get; set; }

        public List<UseRoleDto> Roles { get; set; }

        public string EmailAddress { get; set; }

        public bool IsEmailConfirmed { get; set; }

        public string Avatar { get; set; }

        public bool IsSpreader { get; set; }

        public decimal Sales { get; set; }

        public DateTime? LastLoginTime { get; set; }

        public bool IsActive { get; set; }

        public DateTime CreationTime { get; set; }

        public bool ShouldChangePasswordOnNextLogin { get; set; }


        [AutoMapFrom(typeof(UserRole))]
        public class UseRoleDto
        {
            public int RoleId { get; set; }

            public string RoleName { get; set; }
        }
    }
}