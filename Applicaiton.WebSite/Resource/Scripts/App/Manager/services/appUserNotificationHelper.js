(function () {
    appModule.factory('appUserNotificationHelper',
        ['infrastructure.services.app.notification',
            function (notificationService) {

                /* Message Extracting based on Notification Data Type ********/

                //add your custom notification data types here...

                /* Example:
                infrastructure.notifications.messageFormatters['MyCompanyName.infrastructureZeroTemplate.MyNotificationDataType'] = function(notification) {
                    return ...; //format and return message here
                };
                */

                /* Converter functions ***************************************/

                function getUiIconBySeverity(severity) {
                    switch (severity) {
                        case infrastructure.notifications.severity.SUCCESS:
                            return 'icon-check';
                        case infrastructure.notifications.severity.WARN:
                            return 'icon-warning';
                        case infrastructure.notifications.severity.ERROR:
                            return 'icon-bolt';
                        case infrastructure.notifications.severity.FATAL:
                            return 'icon-bomb';
                        case infrastructure.notifications.severity.INFO:
                        default:
                            return 'icon-info';
                    }
                }

                function getUrl(notification) {

                    switch (notification.notification.notificationName) {
                        case 'Order.Payed':
                            return 'order.index'
                        case 'Order.Created':
                            return 'order.index';
                        case 'App.NewUserRegistered':
                            return 'user.index';
                        case 'App.NewTenantRegistered':
                            return 'tenant.index';
                            break;
                            //Add your custom notification names to navigate to a URL when user clicks to a notification.
                    }

                    //No url for this notification
                    return null;
                }

                /* PUBLIC functions ******************************************/
                var format = function (notification, truncateText) {
                    var formatted = {
                        notificationId: notification.id,
                        text: infrastructure.notifications.getFormattedMessageFromNotification(notification),
                        time: notification.notification.creationTime,
                        icon: getUiIconBySeverity(notification.notification.severity),
                        state: infrastructure.notifications.getUserNotificationStateAsString(notification.state),
                        data: notification.notification.data,
                        url: getUrl(notification)
                    };

                    if (truncateText) {
                        formatted.text = formatted.text.truncateStringWithPostfix(100);
                    }
                    return formatted;
                };

                var show = function (notification) {
                    infrastructure.notifications.showUiNotifyFornotification(notification, {
                        'onclick': function () {
                            //Take action when user clicks to live toastr notification
                            var url = getUrl(notification);

                            if (url) {
                                location.href = url;
                            }
                        }
                    });
                };

                var setAllAsRead = function (callback) {
                    notificationService.setAllNotificationsAsRead().then(function () {
                        infrastructure.event.trigger('app.notifications.refresh');
                        callback && callback();
                    });
                };

                var setAsRead = function (notificationId, callback) {
                    notificationService.setNotificationAsRead({
                        id: notificationId
                    }).then(function () {
                        infrastructure.event.trigger('app.notifications.read', notificationId);
                        callback && callback(notificationId);
                    });
                };

                /* Expose public API *****************************************/
                return {
                    format: format,
                    show: show,
                    setAllAsRead: setAllAsRead,
                    setAsRead: setAsRead,
                };
            }
        ]);
})();