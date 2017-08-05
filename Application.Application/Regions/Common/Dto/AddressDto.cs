using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Regions.Common.Dto
{
    [AutoMapFrom(typeof(Address))]
    public class AddressDto:EntityDto
    {
        public string Code { get; set; }

        public string Name { get; set; }

        public int? ParentId { get; set; }

        public int Level { get; set; }

        public DevelopLevel DevelopLevel { get; set; }

        public int Sort { get; set; }

        public string EnglishName { get; set; }

        public string ShortEnglishName { get; set; }

        public string FullAddress { get; set; }
    }
}
