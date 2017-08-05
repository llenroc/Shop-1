using Infrastructure.Application.DTO;
using Infrastructure.Application.Editions;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Entities.Auditing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Editions.Dto
{
    [AutoMapFrom(typeof(Edition))]
    public class EditionListDto : EntityDto, IHasCreationTime
    {
        public string Name { get; set; }

        public string DisplayName { get; set; }

        public DateTime CreationTime { get; set; }
    }
}
