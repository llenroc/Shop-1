using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(SpecificationProperty))]
    public class SpecificationPropertyCreateOrEditDto : NullableIdDto
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public SpecificationPropertyType Type { get; set; }
    }
}
