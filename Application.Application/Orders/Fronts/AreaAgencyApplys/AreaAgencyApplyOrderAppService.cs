using Application.AreaAgents;
using Application.AreaAgents.AreaAgencyApplys;
using Application.AreaAgents.AreaAgencyApplys.Orders;
using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Authorization.Users;
using Application.CustomerInfos;
using Application.Customers;
using Application.Orders.Fronts.AreaAgencyApplys.Dto;
using Application.Regions;
using Application.Regions.Fronts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.AreaAgencyApplys
{
    public class AreaAgencyApplyOrderAppService : ApplicationAppServiceBase, IAreaAgencyApplyOrderAppService
    {
        public AreaAgencyApplyOrderManager OrderManager { get; set; }
        public AreaAgencyApplyOrderCreator OrderCreator { get; set; }
        public IRepository<AreaAgencyApplyOrder> AreaAgencyApplyOrderRepository { get; set; }
        public IRepository<AreaAgencyApply> AreaAgencyApplyRepository { get; set; }
        public IRepository<AreaAgent> AreaAgentRepository { get; set; }
        public IRepository<CustomerInfo> CustomerInfoRepository { get; set; }
        public CustomerInfoManager CustomerInfoManager { get; set; }
        public AddressManager AddressManager { get; set; }
        public AreaAgentAreaManager AreaAgentAreaManager { get; set; }

        public OrderConfirmOutput ConfirmOrder(OrderConfirmInput input)
        {
            AreaAgencyApplyBoughtContext boughtContext = input.MapTo<AreaAgencyApplyBoughtContext>();
            boughtContext.AreaAgent = AreaAgentRepository.Get(input.AreaAgentId);
            OrderCreator.SalePriceProvider.Caculate(boughtContext);
            OrderConfirmOutput orderConfirmOutput = boughtContext.MapTo<OrderConfirmOutput>();
            return orderConfirmOutput;
        }

        public List<AddressDto> GetAddresses(AddressGetAllInput input)
        {
            List<Address> addresses = AreaAgentAreaManager.GetAvailableAddresses(input.ParentId,input.IsLast);
            return addresses.MapTo<List<AddressDto>>();
        }

        public async Task<AreaAgencyApplyOrderDto> CreateOrder(AreaAgencyApplyOrderCreateInput input)
        {
            AreaAgencyApplyBoughtContext boughtContext = new AreaAgencyApplyBoughtContext()
            {
                AreaAgent = AreaAgentRepository.Get(input.AreaAgentId),
                AddressIds=input.AddressIds
            };
            UserManager.UpdateUserDetail(GetCurrentUser(),new UserDetailInfo()
            {
                FullName=input.UserDetail.FullName,
                PhoneNumber = input.UserDetail.PhoneNumber,
                WechatName = input.UserDetail.WechatName,
                IdentityNumber = input.UserDetail.IdentityNumber,
            });
            AreaAgencyApplyOrder order =await OrderCreator.CreateOrder(boughtContext);
            return ObjectMapper.Map<AreaAgencyApplyOrderDto>(order);
        }

        public AreaAgencyApplyOrderDto Get(IdInput input)
        {
            AreaAgencyApplyOrder order = AreaAgencyApplyOrderRepository.Get(input.Id);
            return order.MapTo<AreaAgencyApplyOrderDto>();
        }
    }
}