using Application.Authorization.End.Users.Dto;
using Application.Members.MemberLevels.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;

namespace Application.Members.MemberCards.Dto
{
    [AutoMapFrom(typeof(MemberCard))]
    public class MemberCenterMemberCardDto : AuditedEntityDto
    {
        public MemberLevelDto Level { get; set; }

        public string No { get; set; }

        public long UserId { get; set; }

        public virtual UserListDto User { get; set; }

        public long? Expiry { get; set; }

        public DateTime? LimitTime { get; set; }
    }
}
