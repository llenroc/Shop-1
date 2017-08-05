using Application.Regions;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Linq;
using Application.AreaAgents.AreaAgencyApplys;
using Application.Customers;
using Application.Agents;

namespace Application.AreaAgents
{
    public class AreaAgentAreaManager:ApplicationDomainServiceBase
    {
        public IRepository<Address> AddressRepository { get; set; }
        public IRepository<AreaAgencyApplyAddress> AreaAgencyApplyAddressRepository { get; set; }
        public IRepository<AreaAgencyArea> AreaAgencyAreaRepository { get; set; }
        public IRepository<CustomerInfo> CustomerInfoRepository { get; set; }
        public AddressManager AddressManager { get; set; }

        public int[] GetAvailableAddressIds(int? parentId)
        {
            int[] areaAgencyAreaAddressIds = AreaAgencyAreaRepository
                .GetAll()
                .GroupBy(model => model.AddressId)
                .Select(model => model.Key).ToArray();

            int[] areaAgencyApplyAddressIds = AreaAgencyApplyAddressRepository
                .GetAll()
                .Where(model=>model.AreaAgencyApply.Status==AgencyApplyStatus.Applying|| model.AreaAgencyApply.Status == AgencyApplyStatus.Success)
                .GroupBy(model => model.AddressId)
                .Select(model => model.Key).ToArray();

            int[] addressIds = AddressManager.GetAddresses(parentId).Select(model => model.Id).ToArray();
            return addressIds.Except(areaAgencyAreaAddressIds).Except(areaAgencyApplyAddressIds).ToArray();
        }

        public List<Address> GetAvailableAddresses(int? parentId,bool isLast)
        { 
            List<Address> addresses = AddressManager.GetAddresses(parentId);

            if (isLast)
            {
                int[] areaAgencyAreaAddressIds = AreaAgencyAreaRepository
                    .GetAll()
                    .GroupBy(model => model.AddressId)
                    .Select(model => model.Key).ToArray();

                int[] areaAgencyApplyAddressIds = AreaAgencyApplyAddressRepository
                    .GetAll()
                    .Where(model => model.AreaAgencyApply.Status == AgencyApplyStatus.Applying || model.AreaAgencyApply.Status == AgencyApplyStatus.Success)
                    .GroupBy(model => model.AddressId)
                    .Select(model => model.Key).ToArray();

                addresses = addresses.Where(model => !areaAgencyAreaAddressIds.Contains(model.Id)
                 && !areaAgencyApplyAddressIds.Contains(model.Id)).ToList();
            }
            return addresses;
        }

        public int[] GetAvailableAddressIds()
        {
            int[] areaAgencyAreaAddressIds = AreaAgencyAreaRepository
                .GetAll()
                .GroupBy(model=>model.AddressId)
                .Select(model => model.Key).ToArray();

            int[] areaAgencyApplyAddressIds= AreaAgencyApplyAddressRepository
                .GetAll()
                .Where(model => model.AreaAgencyApply.Status == AgencyApplyStatus.Applying || model.AreaAgencyApply.Status == AgencyApplyStatus.Success)
                .GroupBy(model => model.AddressId)
                .Select(model => model.Key).ToArray();

            int[] addressIds = AddressManager.GetAllAddresses().Select(model => model.Id).ToArray();
            return addressIds.Except(areaAgencyAreaAddressIds).Except(areaAgencyApplyAddressIds).ToArray();
        }

        public List<CustomerInfo> GetCustomers(int areaAgencyId)
        {
            List<CustomerInfo> customerInfos = new List<CustomerInfo>();
            List<AreaAgencyArea> areaAgencyAreas = AreaAgencyAreaRepository.GetAll()
               .Where(model => model.AreaAgencyId == areaAgencyId).ToList();

            foreach (AreaAgencyArea areaAgencyArea in areaAgencyAreas)
            {
                customerInfos.AddRange(GetCustomers(areaAgencyArea));
            }
            return customerInfos;
        }

        private List<CustomerInfo> GetCustomers(AreaAgencyArea areaAgencyArea)
        {
            var currentAddress = areaAgencyArea.Address;
            List<CustomerInfo> customerInfos = new List<CustomerInfo>();

            switch (currentAddress.Level)
            {
                case 0:
                    break;
                case 1:
                    //
                    customerInfos = CustomerInfoRepository.GetAll().Where(model => model.Address.Parent.ParentId == currentAddress.Id).ToList();
                    break;
                case 2:
                    customerInfos = CustomerInfoRepository.GetAll().Where(model => model.Address.ParentId == currentAddress.Id).ToList();
                    break;
                case 3:
                    customerInfos = CustomerInfoRepository.GetAll().Where(model => model.AddressId == currentAddress.Id).ToList();
                    break;
            }
            return customerInfos;
        }

        public int GetCustomerCount(int areaAgencyId)
        {
            int count = 0;
            List<AreaAgencyArea> areaAgencyAreas = AreaAgencyAreaRepository.GetAll()
                .Where(model => model.AreaAgencyId == areaAgencyId).ToList();

            foreach(AreaAgencyArea areaAgencyArea in areaAgencyAreas)
            {
                count += GetCustomerCount(areaAgencyArea);
            }
            return count;
        }

        private int GetCustomerCount(AreaAgencyArea areaAgencyArea)
        {
            var currentAddress = areaAgencyArea.Address;
            int count = 0;

            switch (currentAddress.Level)
            {
                case 0:
                    break;
                case 1:
                    //
                    count=CustomerInfoRepository.GetAll().Where(model => model.Address.Parent.ParentId == currentAddress.Id).Count();
                    break;
                case 2:
                    count = CustomerInfoRepository.GetAll().Where(model => model.Address.ParentId == currentAddress.Id).Count();
                    break;
                case 3:
                    count = CustomerInfoRepository.GetAll().Where(model => model.AddressId == currentAddress.Id).Count();
                    break;
            }
            return count;
        }
    }
}
