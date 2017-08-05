using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using Infrastructure.Auditing;
using Infrastructure.Authorization.Users;
using Infrastructure.MultiTenancy;
using Application.Authorization.Users;
using Infrastructure.Extensions;

namespace Application.WebSite.Models.Account
{
    public class RegisterViewModel : IValidatableObject
    {
        /// <summary>
        /// Not required for single-tenant applications.
        /// </summary>
        [StringLength(TenantBase.MaxTenancyNameLength)]
        public string TenancyName { get; set; }

        [Required]
        [StringLength(User.MaxNameLength)]
        public string Name { get; set; }

        [Required]
        [StringLength(User.MaxSurnameLength)]
        public string Surname { get; set; }

        [StringLength(User.MaxNickNameLength)]
        public string NickName { get; set; }

        [StringLength(UserBase.MaxUserNameLength)]
        public string UserName { get; set; }

        [EmailAddress]
        [StringLength(UserBase.MaxEmailAddressLength)]
        public string EmailAddress { get; set; }

        [StringLength(User.MaxPlainPasswordLength)]
        [DisableAuditing]
        public string Password { get; set; }

        public bool IsExternalLogin { get; set; }

        public string Avatar { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (!UserName.IsNullOrEmpty())
            {
                var emailRegex = new Regex(@"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");

                if (!UserName.Equals(EmailAddress) && emailRegex.IsMatch(UserName))
                {
                    yield return new ValidationResult("Username cannot be an email address unless it's same with your email address !");
                }
            } 
        }
    }
}