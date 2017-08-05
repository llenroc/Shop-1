using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using Infrastructure.Runtime.Caching;
using System.Collections.Generic;
using System.Linq;

namespace Application.Regions
{
    public class AddressManager:ApplicationDomainServiceBase
    {
        public ICacheManager CacheManager { get; set; }
        public IRepository<Address> AddressRepository { get; set; }

        public List<Address> GetAddresses(int? parentId)
        {
            return (CacheManager
                    .GetCache("Address")
                    .Get(parentId, () => GetAddressesFromDatabase(parentId)) as List<Address>);
        }

        public List<Address> GetAllAddresses()
        {
            return (CacheManager
                    .GetCache("Address")
                    .Get("allAddresses",() => GetAllAddressesFromDatabase()) as List<Address>);
        }

        public List<Address> GetAddressesFromDatabase(int? parentId)
        {
            return AddressRepository.GetAll().WhereIf(parentId.HasValue,model => model.ParentId == parentId).ToList();
        }

        public List<Address> GetAllAddressesFromDatabase()
        {
            return AddressRepository.GetAll().ToList();
        }
    }
}
