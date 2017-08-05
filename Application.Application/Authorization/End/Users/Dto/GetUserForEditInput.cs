using Infrastructure.Application.DTO;

namespace Application.Authorization.End.Users.Dto
{
    public class GetUserForEditInput: NullableIdDto<long>
    {
        public long? ParentUserId { get; set; }
    }
}
