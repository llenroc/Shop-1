using Application.CustomerInfos;
using Application.CustomerInfos.Dto;
using Application.Products.Orders;
using Application.Scores.Orders;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Orders.Fronts.Products.Dto
{
    [AutoMapFrom(typeof(ProductBoughtContext),typeof(ScoreExchangeBoughtContext))]
    public class OrderConfirmOutput
    {
        public List<BoughtItemOutput> BoughtItems { get; set; }

        public bool IsNeedLogistics { get; set; }

        public CustomerInfoDto CustomerInfo { get; set; }

        public List<CustomCustomerInfo> CustomCustomerInfos { get; set; }

        public decimal Money { get; set; }

        public decimal Postage { get; set; }
    }
}
