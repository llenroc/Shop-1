using Application.Authorization.Users;

namespace Application.AreaAgents.AreaAgentCertificates
{
    public class AreaAgentCertificateCreateInput
    {
        public User User { get; set; }

        public AreaAgency AreaAgency { get; set; }
    }
}
