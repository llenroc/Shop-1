using Application.Members.MemberLevels.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Members.MemberLevels
{
    public class MemberLevelAppService : CrudAppService<
        MemberLevel,
        MemberLevelDto,
        int, 
        PagedAndSortedResultRequestDto,
        MemberLevelCreateInput>, 
        IMemberLevelAppService
    {
        public MemberLevelAppService(IRepository<MemberLevel> repository):base(repository)
        {

        }
    }
}
