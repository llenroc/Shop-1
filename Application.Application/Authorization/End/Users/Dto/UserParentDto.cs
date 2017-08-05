using Application.Authorization.Users;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Authorization.End.Users.Dto
{
    [AutoMapFrom(typeof(User))]
    public class UserParentDto : AuditedEntityDto<long>
    {
        public string Avatar { get; set; }

        public string NickName { get; set; }

        public string UserName { get; set; }

        public bool IsSpreader { get; set; }

        public decimal Sales { get; set; }
    }
}
