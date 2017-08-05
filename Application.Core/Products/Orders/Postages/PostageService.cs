using Application.Customers;
using Application.Expresses;
using Application.Products.Orders.Entities;
using Infrastructure.Domain.Repositories;
using System;
using System.Collections.Generic;

namespace Application.Products.Orders.Postages
{
    public class PostageService: PostageService<ProductOrder>
    {

    }

    public class PostageService<TProductOrder> : ApplicationDomainServiceBase where TProductOrder:ProductOrder,new()
    {
        public IRepository<CustomerInfo> CustomerInfoRepository { get; set; }

        public void ComputePostage(ProductBoughtContext<TProductOrder> boughtContext)
        {
            if (!boughtContext.CustomerInfoId.HasValue)
            {
                return;
            }
            var customerInfo = CustomerInfoRepository.Get(boughtContext.CustomerInfoId.Value);

            decimal maxUnifiedFreight = 0;
            decimal customFreight = 0;
            Dictionary<int, DeliveryAreaComputeUnit> freightTemplateDictionary = new Dictionary<int, DeliveryAreaComputeUnit>();

            if (customerInfo == null)
            {
                return;
            }

            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                FreightTemplate freightTemplate = boughtItem.Specification.Product.FreightTemplate;

                if (freightTemplate==null||freightTemplate.IsFreeShipping)
                {
                    continue;
                }

                if(freightTemplate.FreightPlan== FreightPlan.Unified)
                {
                    if(freightTemplate.UnifiedFreight> maxUnifiedFreight)
                    {
                        maxUnifiedFreight = freightTemplate.UnifiedFreight;
                    }
                }
                else if (freightTemplate.FreightPlan == FreightPlan.Custom)
                {
                    foreach(DeliveryArea deliveryArea in freightTemplate.DeliveryAreas)
                    {
                        List<string> addressList = new List<string>(deliveryArea.Addresses.Split(','));

                        if (addressList.Contains(customerInfo.AddressId.ToString()))
                        {
                            if (!freightTemplateDictionary.ContainsKey(deliveryArea.Id))
                            {
                                freightTemplateDictionary[deliveryArea.Id] = new DeliveryAreaComputeUnit()
                                {
                                    DeliveryArea= deliveryArea,
                                    Count= boughtItem.Count
                                };
                            }
                            else
                            {
                                freightTemplateDictionary[deliveryArea.Id].Count += boughtItem.Count;
                            }
                        }
                        break;
                    } 
                }
                customFreight = ComputeCustomFreight(freightTemplateDictionary);
                boughtContext.Postage = maxUnifiedFreight + customFreight;
            }
        }

        private decimal ComputeCustomFreight(Dictionary<int, DeliveryAreaComputeUnit> freightTemplateDictionary)
        {
            decimal customFreight = 0;

            foreach (KeyValuePair<int, DeliveryAreaComputeUnit> keyValuePair in freightTemplateDictionary)
            {
                customFreight+= keyValuePair.Value.DeliveryArea.FirstFee +
                    (decimal)Math.Floor((keyValuePair.Value.Count - 1) / keyValuePair.Value.DeliveryArea.AdditionalAmount) * keyValuePair.Value.DeliveryArea.AdditionalFee;
            }
            return customFreight;
        }
    }
}
