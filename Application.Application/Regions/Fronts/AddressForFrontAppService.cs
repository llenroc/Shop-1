using Application.Regions.Fronts.Dto;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;

namespace Application.Regions.Fronts
{
    public class AddressForFrontAppService: IAddressForFrontAppService
    {
        private IRepository<Address> _addressRepository;
        public AddressManager AddressManager { get; set; }

        public AddressForFrontAppService(IRepository<Address> addressRepository)
        {
            _addressRepository = addressRepository;
        }

        public List<AddressDto> GetAddresses(AddressGetAllInput input)
        {
            return AddressManager.GetAddresses(input.ParentId).MapTo<List<AddressDto>>();
        }
    }
}
