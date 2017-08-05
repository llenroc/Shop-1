using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(SpecificationPropertyValue))]
    public class SpecificationPropertyValueForCreateOrEditDto:NullableIdDto
    {
        public int SpecificationId { get; set; }

        public int SpecificationPropertyId { get; set; }

        public string Value { get; set; }
    }
}
