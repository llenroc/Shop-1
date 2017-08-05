(function () {
    var controllerId = 'app.manager.layout.header';
    appModule.controller(controllerId,
        ['$rootScope', '$state', 'appSession', 'appUserNotificationHelper', 'infrastructure.services.app.notification',
            function ($rootScope, $state, appSession, appUserNotificationHelper, notificationService) {
                var vm = this;
                vm.languages = infrastructure.localization.languages;
                vm.currentLanguage = infrastructure.localization.currentLanguage;

                vm.isLogined = infrastructure.session.userId;

                vm.notifications = [];
                vm.unreadNotificationCount = 0;
                vm.unreadChatMessageCount = 0;

                vm.loadNotifications = function () {
                    notificationService.getUserNotifications({
                        pageSize: 3
                    }).then(function (result) {
                        var result = result.data;
                        vm.unreadNotificationCount = result.unreadCount;
                        vm.notifications = [];
                        $.each(result.items, function (index, item) {
                            vm.notifications.push(appUserNotificationHelper.format(item));
                        });
                    });
                };
                vm.setAllNotificationsAsRead = function () {
                    appUserNotificationHelper.setAllAsRead();
                };
                vm.setNotificationAsRead = function (userNotification) {
                    appUserNotificationHelper.setAsRead(userNotification.id);
                };
                vm.user = appSession.user;
                vm.tenant = appSession.tenant;
                vm.getShownUserName = function () {

                    if (!infrastructure.multiTenancy.isEnabled) {
                        return appSession.user.userName;
                    }
                    else {

                        if (appSession.tenant) {
                            return appSession.tenant.tenancyName + '\\' + appSession.user.userName;
                        }
                        else {
                            return '.\\' + appSession.user.userName;
                        }
                    }
                };
                infrastructure.event.on('infrastructure.notifications.received', function (userNotification) {
                    vm.loadNotifications();
                });

                infrastructure.event.on('infrastructure.notifications.refresh', function () {
                    vm.loadNotifications();
                });

                infrastructure.event.on('infrastructure.notifications.read', function (userNotificationId) {

                    for (var i = 0; i < vm.notifications.length; i++) {

                        if (vm.notifications[i].userNotificationId == userNotificationId) {
                            vm.notifications[i].state = 'READ';
                        }
                    }
                    vm.unreadNotificationCount -= 1;
                });

                //Chat
                infrastructure.event.on('app.chat.unreadMessageCountChanged', function (messageCount) {
                    vm.unreadChatMessageCount = messageCount;
                });

                function init() {
                    vm.loadNotifications();
                }
                init();
            }
        ]);
})();