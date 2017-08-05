using Application.Authorization.Users;

namespace Application.Authorization.End.Users.Dto
{
    public class UserSourceStatisticsDto
    {
        public int Count { get; set; }
        public UserSource UserSource { get; set; }
    }
}
