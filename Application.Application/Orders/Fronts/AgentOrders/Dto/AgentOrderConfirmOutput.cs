using Application.AgentOrders;
using Application.CustomerInfos;
using Application.CustomerInfos.Dto;
using Application.Orders.Fronts.Products.Dto;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Orders.Fronts.AgentOrders.Dto
{
    [AutoMapFrom(typeof(AgentOrderBoughtContext))]
    public class AgentOrderConfirmOutput
    {
        public List<BoughtItemOutput> BoughtItems { get; set; }

        public bool IsNeedLogistics { get; set; }

        public CustomerInfoDto CustomerInfo { get; set; }

        public List<CustomCustomerInfo> CustomCustomerInfos { get; set; }

        public decimal Money { get; set; }

        public decimal Postage { get; set; }

        public float Discount { get; set; }
    }
}
