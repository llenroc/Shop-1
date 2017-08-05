using Application.Agents;
using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;
using Application.Orders.Entities;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Linq;

namespace Application.Channel.ChananlAgencys
{
    public class ChannelAgencyApplyManager : ApplicationDomainServiceBase
    {
        public IRepository<User,long> UserRepository { get; set; }

        public IRepository<ChannelAgency> ChannelAgencyRepository { get; set; }

        public IRepository<ChannelAgencyApply> ChannelAgencyApplyRepository { get; set; }
        public ChannelAgencyManager ChannelAgencyManager { get; set; }

        public ChannelAgencyApply GetApplyingChannelAgencyApplyOfUser(long userId)
        {
            return ChannelAgencyApplyRepository.GetAll().Where(model => model.UserId == userId&&model.Status==AgencyApplyStatus.Applying).FirstOrDefault();
        }

        public ChannelAgencyApply GetChannelAgencyApplyFromOrder(Order order)
        {
            ChannelAgencyApply channelAgencyApply = ChannelAgencyApplyRepository.GetAll().Where(model => model.OrderId == order.Id).FirstOrDefault();
            return channelAgencyApply;
        }

        public ChannelAgencyApply CreateChannelAgencyApply(int channelAgentId,long userId,int orderId)
        {
            ChannelAgencyApply channelAgencyApply = new ChannelAgencyApply()
            {
                UserId = userId,
                OrderId = orderId,
                ChannelAgentId = channelAgentId,
                Status= AgencyApplyStatus.Applying
            };
            ChannelAgencyApplyRepository.Insert(channelAgencyApply);
            CurrentUnitOfWork.SaveChanges();
            return channelAgencyApply;
        }

        public void DeleteChannelAgencyApply(int orderId)
        {
            ChannelAgencyApply channelAgencyApply = ChannelAgencyApplyRepository.GetAll().Where(model => model.OrderId == orderId).FirstOrDefault();
            ChannelAgencyApplyRepository.Delete(channelAgencyApply);
        }

        [UnitOfWork]
        public ChannelAgencyApply PassChannelAgencyApply(ChannelAgencyApply channelAgencyApply)
        {
            ChannelAgencyManager.CreateChannelAgency(channelAgencyApply.ChannelAgent, channelAgencyApply.User);
            channelAgencyApply.Status = AgencyApplyStatus.Success;
            ChannelAgencyApplyRepository.Update(channelAgencyApply);
            CurrentUnitOfWork.SaveChanges();
            return channelAgencyApply;
        }
    }
}
