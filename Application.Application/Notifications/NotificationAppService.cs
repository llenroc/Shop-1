using Application.Notifications.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Notifications;
using Infrastructure.Notifications.Dto;
using Infrastructure.Runtime.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Configuration;

namespace Application.Notifications 
{
    public class NotificationAppService : ApplicationAppServiceBase, INotificationAppService
    {
        private readonly INotificationDefinitionManager _notificationDefinitionManager;
        private readonly IUserNotificationManager _userNotificationManager;
        private readonly INotificationSubscriptionManager _notificationSubscriptionManager;

        public NotificationAppService(
            INotificationDefinitionManager notificationDefinitionManager,
            IUserNotificationManager userNotificationManager,
            INotificationSubscriptionManager notificationSubscriptionManager)
        {
            _notificationDefinitionManager = notificationDefinitionManager;
            _userNotificationManager = userNotificationManager;
            _notificationSubscriptionManager = notificationSubscriptionManager;
        }

        public async Task<GetNotificationsOutput> GetUserNotifications(GetUserNotificationsInput input)
        {
            var totalCount = await _userNotificationManager.GetUserNotificationCountAsync(
                InfrastructureSession.ToUserIdentifier(), input.State
                );

            var unreadCount = await _userNotificationManager.GetUserNotificationCountAsync(
                InfrastructureSession.ToUserIdentifier(), UserNotificationState.Unread
                );

            var notifications = await _userNotificationManager.GetUserNotificationsAsync(
                InfrastructureSession.ToUserIdentifier(), input.State, input.SkipCount, input.PageSize
                );

            return new GetNotificationsOutput(totalCount, unreadCount, notifications);
        }

        public async Task SetAllNotificationsAsRead()
        {
            await _userNotificationManager.UpdateAllUserNotificationStatesAsync(InfrastructureSession.ToUserIdentifier(), UserNotificationState.Read);
        }

        public async Task SetNotificationAsRead(IdInput<Guid> input)
        {
            var userNotification = await _userNotificationManager.GetUserNotificationAsync(InfrastructureSession.TenantId, input.Id);

            if (userNotification.UserId != InfrastructureSession.GetUserId())
            {
                throw new ApplicationException(string.Format("Given user notification id ({0}) is not belong to the current user ({1})", input.Id, InfrastructureSession.GetUserId()));
            }
            await _userNotificationManager.UpdateUserNotificationStateAsync(InfrastructureSession.TenantId, input.Id, UserNotificationState.Read);
        }

        public async Task<GetNotificationSettingsOutput> GetNotificationSettings()
        {
            var output = new GetNotificationSettingsOutput();

            output.ReceiveNotifications = await SettingManager.GetSettingValueAsync<bool>(NotificationSettingNames.ReceiveNotifications);

            output.Notifications = (await _notificationDefinitionManager
                .GetAllAvailableAsync(InfrastructureSession.ToUserIdentifier()))
                .Where(nd => nd.EntityType == null) //Get general notifications, not entity related notifications.
                .MapTo<List<NotificationSubscriptionWithDisplayNameDto>>();

            var subscribedNotifications = (await _notificationSubscriptionManager
                .GetSubscribedNotificationsAsync(InfrastructureSession.ToUserIdentifier()))
                .Select(ns => ns.NotificationName)
                .ToList();

            output.Notifications.ForEach(n => n.IsSubscribed = subscribedNotifications.Contains(n.Name));

            return output;
        }

        public async Task UpdateNotificationSettings(UpdateNotificationSettingsInput input)
        {
            SettingManager.ChangeSettingForUser(InfrastructureSession.ToUserIdentifier(), NotificationSettingNames.ReceiveNotifications, input.ReceiveNotifications.ToString());

            foreach (var notification in input.Notifications)
            {
                if (notification.IsSubscribed)
                {
                    await _notificationSubscriptionManager.SubscribeAsync(InfrastructureSession.ToUserIdentifier(), notification.Name);
                }
                else
                {
                    await _notificationSubscriptionManager.UnsubscribeAsync(InfrastructureSession.ToUserIdentifier(), notification.Name);
                }
            }
        }
    }
}
