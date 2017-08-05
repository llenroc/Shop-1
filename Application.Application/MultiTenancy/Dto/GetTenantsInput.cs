using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;
using Infrastructure.Runtime.Validation;

namespace Application.MultiTenancy.Dto
{
    public class GetTenantsInput :PagedAndSortedResultRequestDto, IShouldNormalize
    {
        public string Filter { get; set; }

        public void Normalize()
        {
            if (string.IsNullOrEmpty(Sorting))
            {
                Sorting = "TenancyName";
            }
            Sorting = Sorting.Replace("editionDisplayName", "Edition.DisplayName");
        }
    }
}
