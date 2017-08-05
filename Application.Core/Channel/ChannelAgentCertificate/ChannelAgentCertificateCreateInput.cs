using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;

namespace Application.Channel.ChannelAgentCertificate
{
    public class ChannelAgentCertificateCreateInput
    {
        public User User { get; set; }

        public ChannelAgency ChannelAgency { get; set; }
    }
}
