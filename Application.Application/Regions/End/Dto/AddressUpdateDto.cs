using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Regions.End.Dto
{
    [AutoMapTo(typeof(Address))]
    public class AddressUpdateDto : EntityDto
    {
        public DevelopLevel DevelopLevel { get; set; }

    }
}
