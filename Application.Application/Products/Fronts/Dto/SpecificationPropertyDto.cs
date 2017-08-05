using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;
using System.ComponentModel.DataAnnotations;

namespace Application.Products.Fronts.Dto
{
    [AutoMap(typeof(SpecificationProperty))]
    public class SpecificationPropertyDto:AuditedEntityDto
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public SpecificationPropertyType Type { get; set; }
    }
}
