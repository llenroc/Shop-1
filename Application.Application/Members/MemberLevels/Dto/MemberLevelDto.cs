using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Members.MemberLevels.Dto
{
    [AutoMapFrom(typeof(MemberLevel))]
    public class MemberLevelDto: FullAuditedEntityDto
    {
        public string Name { get; set; }

        public string DisplayName { get; set; }

        public string Icon { get; set; }
    }
}
