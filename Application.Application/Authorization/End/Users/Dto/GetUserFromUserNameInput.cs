using Infrastructure.Application.DTO;

namespace Application.Authorization.End.Users.Dto
{
    public class GetUserFromUserNameInput:NullableIdDto
    {
        public string UserName { get; set; }
    }
}
