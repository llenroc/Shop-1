using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Products.Fronts.Dto
{
    public class SpecificationPropertyGroup
    {
        public SpecificationPropertyDto SpecificationProperty { get; set; }

        public List<PropertyValueDto> SpecificationPropertyValues { get; set; }
    }

    public class SpecificationPropertyGroupList : List<SpecificationPropertyGroup>
    {
        public bool HasSpecificationProperty(SpecificationProperty specificationProperty)
        {
            foreach (SpecificationPropertyGroup specificationPropertyGroup in this)
            {
                if (specificationPropertyGroup.SpecificationProperty.Id== specificationProperty.Id)
                {
                    return true;
                }
            }
            return false;
        }

        public SpecificationPropertyGroup GetFromSpecificationProperty(SpecificationProperty specificationProperty)
        {
            foreach (SpecificationPropertyGroup specificationPropertyGroup in this)
            {
                if (specificationPropertyGroup.SpecificationProperty.Id== specificationProperty.Id)
                {
                    return specificationPropertyGroup;
                }
            }
            return null;
        }
    }
}
