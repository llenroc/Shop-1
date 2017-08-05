using Application.UnifiedAgents.Entities;
using Infrastructure.Domain.Repositories;

namespace Application.UnifiedAgents
{
    public class UnifiedAgentManager:ApplicationDomainServiceBase
    {
        public IRepository<UnifiedAgent> UnifiedAgentRepository { get; set; }
    }
}
