(function () {
    var controllerId = 'app.manager.layout';
    appModule.controller(controllerId, ['$scope', '$rootScope', 'appUserNotificationHelper',
        function ($scope, $rootScope, appUserNotificationHelper) {
            var vm = this;
            $rootScope.$on('$stateChangeStart', function () {
                vm.isLoadingTemplate = true;
            });
            $rootScope.$on('$stateChangeSuccess', function () {
                vm.isLoadingTemplate = false;
            });
            var webkitNotify = new WebkitNotify();
            infrastructure.event.on('infrastructure.notifications.received', function (userNotification) {
                var options = {
                    title: userNotification.notification.notificationName,
                    body: appUserNotificationHelper.format(userNotification).text
                };
                switch (userNotification.notification.notificationName) {
                    case 'App.NewUserRegistered':
                        options.icon = userNotification.notification.data.properties.avatar;
                        break;
                }
                webkitNotify.notification(options);
                $.audioNotify().notify();
            });
        }]);
})();