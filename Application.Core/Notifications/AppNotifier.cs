using Application.MultiTenancy;
using Application.Authorization.Users;
using Infrastructure;
using Infrastructure.Localization;
using Infrastructure.Notifications;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Domain.Entities;

namespace Application.Notifications
{
    public class AppNotifier : ApplicationDomainServiceBase, IAppNotifier
    {
        private readonly INotificationPublisher _notificationPublisher;

        public AppNotifier(INotificationPublisher notificationPublisher)
        {
            _notificationPublisher = notificationPublisher;
        }

        public async Task WelcomeToTheApplicationAsync(User user)
        {
            await _notificationPublisher.PublishAsync(
                AppNotificationNames.WelcomeToTheApplication,
                new MessageNotificationData(L("WelcomeToTheApplicationNotificationMessage")),
                severity: NotificationSeverity.Success,
                userIds: new[] { user.ToUserIdentifier() }
                );
        }

        public async Task NewUserRegisteredAsync(User user)
        {
            var notificationData = new LocalizableMessageNotificationData(
               new LocalizableString(
                    "NewUserRegisteredNotificationMessage",
                    ApplicationConsts.LocalizationSourceName
                    )
                );
            notificationData["avatar"] = user.Avatar;
            notificationData["userName"] = user.UserName;
            notificationData["nickName"] = user.NickName;
            notificationData["emailAddress"] = user.EmailAddress;
            await _notificationPublisher.PublishAsync(
                AppNotificationNames.NewUserRegistered,
                notificationData,
                tenantIds: new[] { user.TenantId });
        }

        public async Task NewTenantRegisteredAsync(Tenant tenant)
        {
            var notificationData = new LocalizableMessageNotificationData(
                new LocalizableString(
                    "NewTenantRegisteredNotificationMessage",
                    ApplicationConsts.LocalizationSourceName
                    )
                );
            notificationData["tenancyName"] = tenant.TenancyName;
            await _notificationPublisher.PublishAsync(AppNotificationNames.NewTenantRegistered, notificationData);
        }

        //This is for test purposes
        public async Task SendMessageAsync(UserIdentifier user, string message, NotificationSeverity severity = NotificationSeverity.Info)
        {
            await _notificationPublisher.PublishAsync(
                "App.SimpleMessage",
                new MessageNotificationData(message),
                severity: severity,
                userIds: new[] { user }
                );
        }
    }
}
