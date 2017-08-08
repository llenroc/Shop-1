using Application.Authorization.Users;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Authorization.Front.Dto
{
    [AutoMap(typeof(UserDetail))]
    public class UserDetailForEditDto:NullableIdDto
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string WechatName { get; set; }

        public string IdentityNumber { get; set; }
    }
}
