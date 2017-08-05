using Application.Agents;
using Application.Authorization.Users;
using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgencyApplys.Orders;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Channel.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;

namespace Application.Channel.Front
{
    public class ChannelAgencyApplyForFrontAppService : ApplicationAppServiceBase, IChannelAgencyApplyForFrontAppService
    {
        protected IRepository<ChannelAgencyApply> Respository;
        protected IRepository<User, long> UserRespository;
        public IRepository<ChannelAgencyApplyOrder> ChannelAgencyApplyOrderRespository { get; set; }
        public ChannelAgencyManager ChannelAgencyManager { get; set; }
        public ChannelAgencyApplyOrderManager OrderManager { get; set; }

        public ChannelAgencyApplyForFrontAppService(IRepository<ChannelAgencyApply> respository,
            IRepository<User, long> userRespository)
        {
            Respository = respository;
            UserRespository = userRespository;
        }

        public ChannelAgencyApplyDto Get(IdInput input)
        {
            return Respository.Get(input.Id).MapTo<ChannelAgencyApplyDto>();
        }

        [UnitOfWork]
        public void Cancel(IdInput input)
        {
            ChannelAgencyApply channelAgencyApply = Respository.Get(input.Id);
            channelAgencyApply.Status = AgencyApplyStatus.Cancel;
            Respository.Update(channelAgencyApply);

            ChannelAgencyApplyOrder order = ChannelAgencyApplyOrderRespository.Get(channelAgencyApply.OrderId);
            OrderManager.CloseOrder(order);
        }
    }
}
