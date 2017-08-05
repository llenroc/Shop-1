using Application.Authorization.Users;
using Infrastructure.Authorization.Users;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Authorization.End.Users.Profile.Dto
{
    [AutoMap(typeof(User))]
    public class UserUpdateInput
    {
        [Required]
        [StringLength(User.MaxNameLength)]
        public string Name { get; set; }

        public string FullName { get; set; }

        [Required]
        [StringLength(User.MaxSurnameLength)]
        public string Surname { get; set; }

        [StringLength(User.MaxNickNameLength)]
        public string NickName { get; set; }

        [StringLength(UserBase.MaxEmailAddressLength)]
        public string EmailAddress { get; set; }

        public string Avatar { get; set; }
    }
}
