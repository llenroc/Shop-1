using Application.Authorization.Users;
using Infrastructure.Authorization.Users;
using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Authorization.End.Users.Dto
{
    public class UserEditInput : IPassivable
    {
        /// <summary>
        /// Set null to create a new user. Set user's Id to update a user
        /// </summary>
        public long? Id { get; set; }

        [NotMapped]
        public long? ParentUserId { get; set; }

        [Required]
        [StringLength(User.MaxNameLength)]
        public string Name { get; set; }

        public string FullName { get; set; }

        [Required]
        [StringLength(User.MaxSurnameLength)]
        public string Surname { get; set; }

        [StringLength(User.MaxNickNameLength)]
        public string NickName { get; set; }

        [Required]
        [StringLength(UserBase.MaxUserNameLength)]
        public string UserName { get; set; }

        [StringLength(UserBase.MaxEmailAddressLength)]
        public string EmailAddress { get; set; }

        // Not used "Required" attribute since empty value is used to 'not change password'
        [StringLength(User.MaxPlainPasswordLength)]
        public string Password { get; set; }

        public string Avatar { get; set; }

        public decimal Sales { get; set; }

        public bool IsActive { get; set; }

        public bool IsSpreader { get; set; }

        public bool IsHide { get; set; }

        public bool ShouldChangePasswordOnNextLogin { get; set; }

        public UserEditInput()
        {
            Avatar = User.DefaultAvatar;
        }
    }
}
