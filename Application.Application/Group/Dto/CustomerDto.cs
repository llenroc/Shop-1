using Application.Authorization.Users;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;

namespace Application.Group.Dto
{
    [AutoMapFrom(typeof(User))]
    public class CustomerDto:EntityDto<long>
    {
        public string NickName { get; set; }

        public string Avatar { get; set; }

        public UserSource Source { get; set; }

        public int ChildCountOfDepth1 { get; set; }

        public int ChildCountOfDepth2 { get; set; }

        public int ChildCountOfDepth3 { get; set; }

        public DateTime CreationTime { get; set; }
    }
}
