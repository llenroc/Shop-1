using Application.Agents;
using Application.Channel.ChannelAgencies;
using Infrastructure.Domain.Repositories;

namespace Application.Channel.ChannelAgencys
{
    public class ChannelAgencyNumberCreator : AgencyNumberCreator<ChannelAgency>
    {
        public ChannelAgencyNumberCreator(IRepository<ChannelAgency> repository) : base("CA", repository)
        {
        }
    }
}
