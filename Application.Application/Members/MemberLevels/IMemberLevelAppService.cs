using Application.Members.MemberLevels.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Members.MemberLevels
{
    public interface IMemberLevelAppService : ICrudAppService<MemberLevelDto, int, PagedAndSortedResultRequestDto, MemberLevelCreateInput>
    {
    }
}
