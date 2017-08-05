using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Regions.Fronts.Dto
{
    [AutoMapFrom(typeof(Address))]
    public class AddressWithFullNameDto : EntityDto
    {
    }
}
