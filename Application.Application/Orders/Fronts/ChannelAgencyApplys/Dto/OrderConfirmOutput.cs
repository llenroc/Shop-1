using Application.Channel.ChannelAgencyApplys.Orders;
using Application.CustomerInfos;
using Application.CustomerInfos.Dto;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Orders.Fronts.ChannelAgencyApplys.Dto
{
    [AutoMapFrom(typeof(ChannelAgencyApplyBoughtContext))]
    public class OrderConfirmOutput
    {
        public List<BoughtItemOutput> BoughtItems { get; set; }

        public bool IsNeedLogistics { get; set; }

        public CustomerInfoDto CustomerInfo { get; set; }

        public List<CustomCustomerInfo> CustomCustomerInfos { get; set; }
    }
}
