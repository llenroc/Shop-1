using Application.CustomerInfos;
using Application.Orders.BoughtContexts;
using Application.Orders.Entities;
using Application.Products.Orders.Entities;
using Infrastructure.Dependency;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application.Products.Orders
{
    public class ProductBoughtContext : ProductBoughtContext<ProductOrder>
    {
    }

    public class ProductBoughtContext<TOdrer> : IBoughtContext<TOdrer>, ISingletonDependency
    {
        public TOdrer Order { get; set; }

        public decimal Money { get; set; }

        public decimal Postage { get; set; }

        public int Score { get; set; }

        public DateTime? AutoReceiveLimit { get; set; }

        public List<BoughtItem> BoughtItems { get; set; } = new List<BoughtItem>();

        public int? CustomerInfoId { get; set; }

        public OrderCustomerInfo OrderCustomerInfo { get; set; }

        public string NoteOfCustomer { get; set; }

        public List<OrderCustomCustomerInfo> OrderCustomCustomerInfos { get; set; }

        public decimal ChannelAgentRebate { get; set; }

        public int ProductCount
        {
            get
            {
                int count = 0;

                foreach (BoughtItem boughtItem in BoughtItems)
                {
                    count += boughtItem.Count;
                }
                return count;
            }
        }

        public bool IsNeedLogistics
        {
            get
            {
                foreach (BoughtItem boughtItem in BoughtItems)
                {
                    if (boughtItem.Specification.Product.Type == ProductType.Physical)
                    {
                        return true;
                    }
                }
                return false;
            }
        }

        public bool IsNeedShip
        {
            get
            {
                if (BoughtItems.Count > 0)
                {
                    return true;
                }
                return false;
            }
        }

        public List<CustomCustomerInfo> GetCustomCustomerInfos()
        {
            Dictionary<string, CustomCustomerInfo> customCustomerInfoDictionary = new Dictionary<string, CustomCustomerInfo>();

            foreach (BoughtItem boughtItem in BoughtItems)
            {
                if (boughtItem.Specification.Product.CustomCustomerInfos != null)
                {
                    foreach (CustomCustomerInfo customCustomerInfo in boughtItem.Specification.Product.CustomCustomerInfos)
                    {
                        if (!customCustomerInfoDictionary.ContainsKey(customCustomerInfo.Name))
                        {
                            customCustomerInfoDictionary[customCustomerInfo.Name] = customCustomerInfo;
                        }
                    }
                }
            }
            return customCustomerInfoDictionary.Values.ToList();
        }
    }
}
