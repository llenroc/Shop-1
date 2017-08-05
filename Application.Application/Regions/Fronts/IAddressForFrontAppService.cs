using Application.Regions.Fronts.Dto;
using Infrastructure.Application.Services;
using System.Collections.Generic;

namespace Application.Regions.Fronts
{
    public interface IAddressForFrontAppService:IApplicationService
    {
        List<AddressDto> GetAddresses(AddressGetAllInput input);
    }
}
