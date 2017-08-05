using Infrastructure.Application.Features;
using Infrastructure.AutoMapper;
using Infrastructure.UI.Inputs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Editions.Dto
{
    [AutoMapFrom(typeof(Feature))]
    public class FlatFeatureDto
    {
        public string ParentName { get; set; }

        public string Name { get; set; }

        public string DisplayName { get; set; }

        public string Description { get; set; }

        public string DefaultValue { get; set; }

        public IInputType InputType { get; set; }
    }
}
