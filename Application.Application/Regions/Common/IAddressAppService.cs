using Application.Regions.Common.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Collections.Generic;

namespace Application.Regions.Common
{
    public interface IAddressAppService : IApplicationService
    {
        List<AddressDto> GetAddresses(AddressGetAllInput input);

        ListResultDto<AddressTreeDto> GetAddressesTree(AddressGetAllInput input);

        void RepaireAddresses();
    }
}
