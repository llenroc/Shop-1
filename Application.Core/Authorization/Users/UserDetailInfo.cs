using Infrastructure.AutoMapper;

namespace Application.Authorization.Users
{
    [AutoMap(typeof(UserDetail))]
    public class UserDetailInfo
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string WechatName { get; set; }

        public string IdentityNumber { get; set; }
    }
}
