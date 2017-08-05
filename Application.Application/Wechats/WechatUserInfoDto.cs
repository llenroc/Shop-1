using Infrastructure.AutoMapper;

namespace Application.Wechats
{
    [AutoMap(typeof(WechatUserInfo))]
    public class WechatUserInfoDto
    {
        public string OpenId { get; set; }

        public string UnionId { get; set; }

        public string Nickame { get; set; }

        public int Sex { get; set; }

        public string Province { get; set; }

        public string City { get; set; }

        public string Country { get; set; }

        public string HeadimgUrl { get; set; }

        public string Privilege { get; set; }

        public bool Subscribe { get; set; }

        public long SubscribeTime { get; set; }
    }
}
