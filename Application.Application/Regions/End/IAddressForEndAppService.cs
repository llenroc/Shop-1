using Application.Regions.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Collections.Generic;

namespace Application.Regions.End
{
    public interface IAddressForEndAppService : ICrudAppService<AddressDto, int, AddressGetAllInput, AddressDto, AddressUpdateDto>
    {
    }
}
