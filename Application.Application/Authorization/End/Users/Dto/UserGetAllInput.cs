using Application.Authorization.Users;
using Infrastructure.Application.DTO;

namespace Application.Authorization.End.Users.Dto
{
    public class UserGetAllInput: PagedAndSortedResultRequestDto
    {
        public string UserName { get; set; }

        public string NickName { get; set; }

        public bool? IsSpreader { get; set; }

        public UserSource? UserSource { get; set; }
    }
}
