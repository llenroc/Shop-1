using Application.Authorization.Users;
using Application.Regions;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace Application.AreaAgents
{
    public class AreaAgentManager : ApplicationDomainServiceBase
    {
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<Address> AddressRepository { get; set; }
        public IRepository<AreaAgent> AreaAgentRepository { get; set; }
        public IRepository<AreaAgency> AreaAgencyRepository { get; set; }

        public AreaAgent ComputeAreaAgentFromAddresses(List<Address> addresses)
        {
            int minLevel = addresses.Min(model => model.Level);
            AreaAgent areaAgent = AreaAgentRepository.GetAll().Where(model => model.Level == minLevel).FirstOrDefault();
            return areaAgent;
        }
    }
}
