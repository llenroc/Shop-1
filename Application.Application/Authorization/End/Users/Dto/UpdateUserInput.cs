using Application.Authorization.Users;
using Infrastructure.Application.DTO;
using Infrastructure.Authorization.Users;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Authorization.End.Users.Dto
{
    [AutoMap(typeof(User))]
    public class UpdateUserInput : EntityDto<long>
    {
        [Required]
        [StringLength(User.MaxNameLength)]
        public string Name { get; set; }

        [Required]
        [StringLength(User.MaxSurnameLength)]
        public string Surname { get; set; }

        [Required]
        [StringLength(User.MaxNickNameLength)]
        public string NickName { get; set; }

        [StringLength(UserBase.MaxEmailAddressLength)]
        public string EmailAddress { get; set; }

        public bool IsSpreader { get; set; }

        public string Avatar { get; set; }

        public bool IsActive { get; set; }

        public bool ShouldChangePasswordOnNextLogin { get; set; }
    }
}