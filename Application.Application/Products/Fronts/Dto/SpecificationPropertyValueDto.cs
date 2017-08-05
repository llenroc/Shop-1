using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Products.Fronts.Dto
{
    [AutoMap(typeof(SpecificationPropertyValue))]
    public class SpecificationPropertyValueDto:EntityDto
    {
        public int SpecificationId { get; set; }

        public int SpecificationPropertyId { get; set; }

        public string Value { get; set; }
    }
}
