using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgencyApplys.Orders;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Channel.ChannelAgents;
using Application.CustomerInfos;
using Application.CustomerInfos.Dto;
using Application.Customers;
using Application.Orders.Fronts.ChannelAgencyApplys.Dto;
using Application.Products.Orders;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.ChannelAgencyApplys
{
    public class ChannelAgencyApplyOrderAppService : ApplicationAppServiceBase, IChannelAgencyApplyOrderAppService
    {
        public ChannelAgencyApplyOrderManager OrderManager { get; set; }
        public ChannelAgencyApplyOrderCreator OrderCreator { get; set; }
        public IRepository<ChannelAgencyApplyOrder> ChannelAgencyApplyOrderRepository { get; set; }
        public IRepository<ChannelAgencyApply> ChannelAgencyApplyRepository { get; set; }
        public IRepository<ChannelAgent> ChannelAgentRepository { get; set; }
        public IRepository<CustomerInfo> CustomerInfoRepository { get; set; }
        public CustomerInfoManager CustomerInfoManager { get; set; }

        public OrderConfirmOutput ConfirmOrder(OrderConfirmInput input)
        {
            ChannelAgencyApplyBoughtContext boughtContext = input.MapTo<ChannelAgencyApplyBoughtContext>();
            boughtContext.ChannelAgent = ChannelAgentRepository.Get(input.ChannelAgentId);

            foreach(ChannelAgentAssortment channelAgentAssortment in boughtContext.ChannelAgent.ChannelAgentAssortments)
            {
                BoughtItem boughtItem = new BoughtItem()
                {
                    UserId= InfrastructureSession.UserId.Value,
                    ProductId = channelAgentAssortment.Specification.ProductId,
                    SpecificationId = channelAgentAssortment.SpecificationId,
                    Specification = channelAgentAssortment.Specification,
                    Count= channelAgentAssortment.Count
                };
                boughtContext.BoughtItems.Add(boughtItem);
            }
            OrderConfirmOutput orderConfirmOutput = boughtContext.MapTo<OrderConfirmOutput>();
            orderConfirmOutput.CustomCustomerInfos = boughtContext.GetCustomCustomerInfos();

            if (input.CustomerInfoId.HasValue)
            {
                orderConfirmOutput.CustomerInfo = CustomerInfoRepository.Get(input.CustomerInfoId.Value).MapTo<CustomerInfoDto>();
            }
            else
            {
                orderConfirmOutput.CustomerInfo = CustomerInfoManager.GetDefaultCustomerInfo(InfrastructureSession.UserId.Value).MapTo<CustomerInfoDto>();
            }
            return orderConfirmOutput;
        }

        public async Task<ChannelAgencyApplyOrderDto> CreateOrder(ChannelAgencyApplyOrderCreateInput input)
        {
            ChannelAgencyApplyBoughtContext boughtContext = new ChannelAgencyApplyBoughtContext()
            {
                ChannelAgent = ChannelAgentRepository.Get(input.ChannelAgentId),
                CustomerInfoId=input.CustomerInfoId
            };
            UserManager.UpdateUserDetail(GetCurrentUser(), new UserDetailInfo()
            {
                FullName = input.UserDetail.FullName,
                PhoneNumber = input.UserDetail.PhoneNumber,
                WechatName = input.UserDetail.WechatName,
                IdentityNumber = input.UserDetail.IdentityNumber,
            });
            ChannelAgencyApplyOrder order =await OrderCreator.CreateOrder(boughtContext);
            return ObjectMapper.Map<ChannelAgencyApplyOrderDto>(order);
        }

        public ChannelAgencyApplyOrderDto Get(IdInput input)
        {
            ChannelAgencyApplyOrder order = ChannelAgencyApplyOrderRepository.Get(input.Id);
            return order.MapTo<ChannelAgencyApplyOrderDto>();
        }
    }
}
