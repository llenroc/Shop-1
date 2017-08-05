using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Regions.Common.Dto
{
    [AutoMapFrom(typeof(Address))]
    public class AddressTreeDto:EntityDto
    {
        public string Code { get; set; }

        public string Name { get; set; }

        public int? ParentId { get; set; }

        public List<AddressTreeDto> Children { get; set; }

        public int Level { get; set; }

        public int Sort { get; set; }

        public string EnglishName { get; set; }

        public string ShortEnglishName { get; set; }
    }
}
