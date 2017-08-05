using Infrastructure.AutoMapper;

namespace Application.Regions.Common.Dto
{
    [AutoMapFrom(typeof(Address))]
    public class CommonAddressDto
    {
        public string Code { get; set; }

        public string FullAddress { get; set; }

        public DevelopLevel DevelopLevel { get; set; }
    }
}
