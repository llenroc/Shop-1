using Application.Authorization.Users;
using Infrastructure.AutoMapper;
using System;

namespace Application.Authorization.Front.Dto
{
    [AutoMapFrom(typeof(User))]
    public class CommonUserForProfileDto
    {
        public string NickName { get; set; }

        public string Avatar { get; set; }

        public UserSource Source { get; set; }

        public int ChildCountOfDepth1 { get; set; }

        public int ChildCountOfDepth2 { get; set; }

        public int ChildCountOfDepth3 { get; set; }

        public int ChannelAgentDepth { get; set; }

        public DateTime CreationTime { get; set; }
    }
}
