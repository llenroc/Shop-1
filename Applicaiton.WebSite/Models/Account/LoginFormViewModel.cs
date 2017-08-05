namespace Application.WebSite.Models.Account
{
    public class LoginFormViewModel
    {
        public string TenancyName { get; set; }

        public string ReturnUrl { get; set; }

        public bool IsMultiTenancyEnabled { get; set; }

        public string UserNameOrEmailAddress { get; set; }

        public bool IsSelfRegistrationEnabled { get; set; }
    }
}