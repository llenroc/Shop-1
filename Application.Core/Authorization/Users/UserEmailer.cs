using Application.Emailing;
using Application.MultiTenancy;
using Application.Web;
using Castle.Core.Internal;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Net.Mail;
using Infrastructure.Runtime.Security;
using System;
using System.Text;
using System.Threading.Tasks;

namespace Application.Authorization.Users
{
    public class UserEmailer : ApplicationServiceBase, IUserEmailer, ITransientDependency
    {
        private readonly IEmailTemplateProvider _emailTemplateProvider;
        private readonly IEmailSender _emailSender;
        private readonly IWebUrlService _webUrlService;
        private readonly IRepository<Tenant> _tenantRepository;
        private readonly ICurrentUnitOfWorkProvider _unitOfWorkProvider;

        public UserEmailer(IEmailTemplateProvider emailTemplateProvider,
            IEmailSender emailSender,
            IWebUrlService webUrlService,
            IRepository<Tenant> tenantRepository,
            ICurrentUnitOfWorkProvider unitOfWorkProvider)
        {
            _emailTemplateProvider = emailTemplateProvider;
            _emailSender = emailSender;
            _webUrlService = webUrlService;
            _tenantRepository = tenantRepository;
            _unitOfWorkProvider = unitOfWorkProvider;
        }

        /// <summary>
        /// Send email activation link to user's email address.
        /// </summary>
        /// <param name="user">User</param>
        /// <param name="plainPassword">
        /// Can be set to user's plain password to include it in the email.
        /// </param>
        [UnitOfWork]
        public virtual async Task SendEmailActivationLinkAsync(User user, string plainPassword = null)
        {
            if (user.EmailConfirmationCode.IsNullOrEmpty())
            {
                throw new ApplicationException("EmailConfirmationCode should be set in order to send email activation link.");
            }
            var tenancyName = GetTenancyNameOrNull(user.TenantId);

            var link = _webUrlService.GetSiteRootAddress(tenancyName) + "Account/EmailConfirmation" +
                       "?userId=" + Uri.EscapeDataString(SimpleStringCipher.Instance.Encrypt(user.Id.ToString())) +
                       "&tenantId=" + (user.TenantId == null ? "" : Uri.EscapeDataString(SimpleStringCipher.Instance.Encrypt(user.TenantId.Value.ToString()))) +
                       "&confirmationCode=" + Uri.EscapeDataString(user.EmailConfirmationCode);

            var emailTemplate = new StringBuilder(_emailTemplateProvider.GetDefaultTemplate());
            emailTemplate.Replace("{EMAIL_TITLE}", L("EmailActivationTitle"));
            emailTemplate.Replace("{EMAIL_SUB_TITLE}", L("EmailActivationSubTitle"));

            var mailMessage = new StringBuilder();
            mailMessage.AppendLine("<b>" + L("NameSurname") + "</b>: " + user.Name + " " + user.Surname + "<br />");

            if (!tenancyName.IsNullOrEmpty())
            {
                mailMessage.AppendLine("<b>" + L("TenancyName") + "</b>: " + tenancyName + "<br />");
            }
            mailMessage.AppendLine("<b>" + L("UserName") + "</b>: " + user.UserName + "<br />");

            if (!plainPassword.IsNullOrEmpty())
            {
                mailMessage.AppendLine("<b>" + L("Password") + "</b>: " + plainPassword + "<br />");
            }
            mailMessage.AppendLine("<br />");
            mailMessage.AppendLine(L("EmailActivationClickTheLinkBelowToVerifyYourEmail") + "<br /><br />");
            mailMessage.AppendLine("<a href=\"" + link + "\">" + link + "</a>");

            emailTemplate.Replace("{EMAIL_BODY}", mailMessage.ToString());
            await _emailSender.SendAsync(user.EmailAddress, L("EmailActivationSubject"), emailTemplate.ToString());
        }

        /// <summary>
        /// Sends a password reset link to user's email.
        /// </summary>
        /// <param name="user">User</param>
        public async Task SendPasswordResetLinkAsync(User user)
        {
            if (user.PasswordResetCode.IsNullOrEmpty())
            {
                throw new ApplicationException("PasswordResetCode should be set in order to send password reset link.");
            }
            var tenancyName = GetTenancyNameOrNull(user.TenantId);

            var link = _webUrlService.GetSiteRootAddress(tenancyName) + "Account/ResetPassword" +
                       "?userId=" + Uri.EscapeDataString(SimpleStringCipher.Instance.Encrypt(user.Id.ToString())) +
                       "&tenantId=" + (user.TenantId == null ? "" : Uri.EscapeDataString(SimpleStringCipher.Instance.Encrypt(user.TenantId.Value.ToString()))) +
                       "&resetCode=" + Uri.EscapeDataString(user.PasswordResetCode);

            var emailTemplate = new StringBuilder(_emailTemplateProvider.GetDefaultTemplate());
            emailTemplate.Replace("{EMAIL_TITLE}", L("PasswordResetEmailTitle"));
            emailTemplate.Replace("{EMAIL_SUB_TITLE}", L("PasswordResetEmailSubTitle"));

            var mailMessage = new StringBuilder();

            mailMessage.AppendLine("<b>" + L("NameSurname") + "</b>: " + user.Name + " " + user.Surname + "<br />");

            if (!tenancyName.IsNullOrEmpty())
            {
                mailMessage.AppendLine("<b>" + L("TenancyName") + "</b>: " + tenancyName + "<br />");
            }

            mailMessage.AppendLine("<b>" + L("UserName") + "</b>: " + user.UserName + "<br />");

            mailMessage.AppendLine("<br />");
            mailMessage.AppendLine(L("PasswordResetEmailClickTheLinkBelowToResetYourPassword") + "<br /><br />");
            mailMessage.AppendLine("<a href=\"" + link + "\">" + link + "</a>");

            emailTemplate.Replace("{EMAIL_BODY}", mailMessage.ToString());

            await _emailSender.SendAsync(user.EmailAddress, L("PasswordResetEmailSubject"), emailTemplate.ToString());
        }

        private string GetTenancyNameOrNull(int? tenantId)
        {
            if (tenantId == null)
            {
                return null;
            }

            using (_unitOfWorkProvider.Current.SetTenantId(null))
            {
                return _tenantRepository.Get(tenantId.Value).TenancyName;
            }
        }
    }
}
