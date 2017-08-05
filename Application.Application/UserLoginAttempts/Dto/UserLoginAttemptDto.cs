using Infrastructure.Application.DTO;
using Infrastructure.Authorization.Users;
using Infrastructure.AutoMapper;
using System;

namespace Application.UserLoginAttempts.Dto
{
    [AutoMapFrom(typeof(UserLoginAttempt))]
    public class UserLoginAttemptDto : EntityDto<long>
    {
        public int? TenantId { get; set; }

        public string TenancyName { get; set; }

        public long? UserId { get; set; }

        public string UserNameOrEmailAddress { get; set; }

        public string ClientIpAddress { get; set; }

        public string ClientName { get; set; }

        public string BrowserInfo { get; set; }

        public LoginResultType Result { get; set; }

        public DateTime CreationTime { get; set; }
    }
}