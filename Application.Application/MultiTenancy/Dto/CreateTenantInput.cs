using System.ComponentModel.DataAnnotations;
using Infrastructure.Authorization.Users;
using Infrastructure.AutoMapper;
using Infrastructure.MultiTenancy;
using Application.Authorization.Users;

namespace Application.MultiTenancy.Dto
{
    [AutoMapTo(typeof(Tenant))]
    public class CreateTenantInput
    {
        [Required]
        [StringLength(TenantBase.MaxTenancyNameLength)]
        [RegularExpression(Tenant.TenancyNameRegex)]
        public string TenancyName { get; set; }

        [Required]
        [StringLength(Tenant.MaxNameLength)]
        public string Name { get; set; }

        [Required]
        [StringLength(UserBase.MaxEmailAddressLength)]
        public string AdminEmailAddress { get; set; }

        [StringLength(User.MaxPasswordLength)]
        public string AdminPassword { get; set; }

        [MaxLength(TenantBase.MaxConnectionStringLength)]
        public string ConnectionString { get; set; }

        public bool ShouldChangePasswordOnNextLogin { get; set; }

        public bool SendActivationEmail { get; set; }

        public int? EditionId { get; set; }

        public bool IsActive { get; set; }
    }
}