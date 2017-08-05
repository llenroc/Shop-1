(function ($) {
    infrastructure.notifications.messageFormatters['Application.Notifications.MessageNotificationDatas.UserMessageNotificationData'] = function (notification) {
        return notification.notification.data.message;
    };
    infrastructure.notifications.messageFormatters['Application.Orders.Notifications.MessageNotificationDatas.OrderMessageNotificationData'] = function (notification) {
        return notification.notification.data.message;
    };
})((infrastructure || (infrastructure = {})), (angular || undefined));