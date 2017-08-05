using Application.Members.MemberCards.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Members.MemberCards
{
    public interface IMemberCardAppService : ICrudAppService<
        MemberCardDto,
        int>
    {
        MemberCardDto GetValidMemberCardOfUser();
    }
}
