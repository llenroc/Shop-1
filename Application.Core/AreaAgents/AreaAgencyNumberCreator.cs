using Application.Agents;
using Infrastructure.Domain.Repositories;

namespace Application.AreaAgents
{
    public class AreaAgencyNumberCreator : AgencyNumberCreator<AreaAgency>
    {
        public AreaAgencyNumberCreator(IRepository<AreaAgency> repository) : base("AA", repository)
        {
        }
    }
}
