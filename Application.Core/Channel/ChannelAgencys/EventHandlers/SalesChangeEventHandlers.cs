using Application.Authorization.Users;
using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgents;
using Application.Sales.Events;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Event.Bus.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Channel.ChannelAgencys.EventHandlers
{
    public class SalesChangeEventHandlers : ApplicationDomainServiceBase, 
        IEventHandler<SalesChangeEventData>, ITransientDependency
    {
        public IRepository<User,long> UserRepository { get; set; }
        public IRepository<ChannelAgent> ChannelAgentRepository { get; set; }
        public IRepository<ChannelAgency> ChannelAgencyRepository { get; set; }
        public ChannelAgencyManager ChannelAgencyManager { get; set; }

        public void HandleEvent(SalesChangeEventData eventData)
        {
            ChannelAgent channelAgent;

            if (!eventData.User.IsChannelAgency)
            {
                channelAgent=ChannelAgentRepository.GetAll().Where(model=>model.MinUpgradeSales<=eventData.Sales)
                    .OrderBy(model => model.Level).FirstOrDefault();
            }
            else
            {
                ChannelAgency channelAgency = ChannelAgencyRepository.Get(eventData.User.UserChannelAgencyId.Value);
                channelAgent = ChannelAgentRepository.GetAll().Where(model => model.MinUpgradeSales <= eventData.Sales
                &&model.Level<channelAgency.ChannelAgent.Level)
                    .OrderBy(model => model.Level).FirstOrDefault();
            }

            if (channelAgent != null)
            {
                ChannelAgencyManager.CreateChannelAgency(channelAgent, eventData.User);
            }
        }
    }
}
