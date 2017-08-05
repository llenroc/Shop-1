using Application.Regions.Common.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Authorization;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace Application.Regions.Common
{
    public class AddressAppService : IAddressAppService
    {
        public AddressManager AddressManager { get; set; }
        private IRepository<Address> _addressRepository;
        public AddressAppService(IRepository<Address> addressRepository)
        {
            _addressRepository = addressRepository;
        }

        public List<AddressDto> GetAddresses(AddressGetAllInput input)
        {
            return AddressManager.GetAddresses(input.ParentId).MapTo<List<AddressDto>>();
        }

        public ListResultDto<AddressTreeDto> GetAddressesTree(AddressGetAllInput input)
        {
            List<Address> addresses = _addressRepository.GetAll().Where(model => model.ParentId == input.ParentId).ToList();
            return new ListResultDto<AddressTreeDto>(addresses.MapTo<List<AddressTreeDto>>());
        }

        [AllowAnonymousAttributeBase]
        public void RepaireAddresses()
        {
            Address rootAddress = _addressRepository.GetAll().Where(model => !model.ParentId.HasValue).FirstOrDefault();
            RepaireAddressesRecursion(rootAddress);
        }

        private void RepaireAddressesRecursion(Address rootAddress)
        {
            List<Address> addresses = _addressRepository.GetAll().Where(model => model.ParentId == rootAddress.Id).ToList();

            foreach(Address address in addresses)
            {
                address.Level = rootAddress.Level + 1;
                _addressRepository.Update(address);
                RepaireAddressesRecursion(address);
            }
        }
    }
}
