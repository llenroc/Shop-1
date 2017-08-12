using Application.Authorization.Users;
using Infrastructure.AutoMapper;

namespace Application.Authorization.Front.Dto
{
    [AutoMapFrom(typeof(UserDetail))]
    public class UserDetailDto
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string WechatName { get; set; }

        public string IdentityNumber { get; set; }

        public string QrcodePath { get; set; }
    }
}
