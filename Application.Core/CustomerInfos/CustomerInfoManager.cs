using Application.Customers;
using Infrastructure;
using Infrastructure.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.CustomerInfos
{
    public class CustomerInfoManager:ApplicationDomainServiceBase
    {
        public IRepository<CustomerInfo> CustomerInfoRespository { get; set; }

        public CustomerInfo GetDefaultCustomerInfo(long userId)
        {
            CustomerInfo customerInfo=CustomerInfoRespository.GetAll().Where(model => (model.CreatorUserId == userId)&&(model.IsDefault == true)).FirstOrDefault();
            return customerInfo;
        }

        public CustomerInfo SetAsDefaultCustomerInfo(int customerInfoId,long userId)
        {
            CustomerInfo currentDefaultCustomerInfo = GetDefaultCustomerInfo(userId);

            if (currentDefaultCustomerInfo != null)
            {
                currentDefaultCustomerInfo.IsDefault = false;
                CustomerInfoRespository.Update(currentDefaultCustomerInfo);
            }
            CustomerInfo customerInfo = CustomerInfoRespository.Get(customerInfoId);
            customerInfo.IsDefault = true;
            CustomerInfoRespository.Update(customerInfo);
            return customerInfo;
        }
    }
}
