using Application.Authorization.Users;

namespace Application.AreaAgents
{
    public class AreaAgencyCreateModel
    {
        public User user { get; set; }

        public int AreaAgentId { get; set; }

        public string FullName { get; set; }

        public string WechatName { get; set; }

        public string IdentityNumber { get; set; }

        public string PhoneNumber { get; set; }
    }
}
