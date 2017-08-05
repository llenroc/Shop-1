using System.ComponentModel.DataAnnotations;

namespace Application.Authorization.End.Users.Dto
{
    public class CreateOrUpdateUserInput
    {
        [Required]
        public UserEditInput User { get; set; }

        [Required]
        public string[] AssignedRoleNames { get; set; }

        public bool SendActivationEmail { get; set; }

        public bool SetRandomPassword { get; set; }
    }
}
