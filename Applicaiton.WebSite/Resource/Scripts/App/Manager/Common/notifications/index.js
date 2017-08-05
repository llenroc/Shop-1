(function () {
    appModule.controller('app.manager.notifications.index', [
        '$scope', 'appUserNotificationHelper', 'infrastructure.services.app.notification',
        function ($scope, appUserNotificationHelper, notificationService) {
            var vm = this;
            $scope.$on('$viewContentLoaded', function () {
                App.initAjax();
            });
            vm.loading = false;
            vm.readStateFilter = 'ALL';
            vm.notifications = null;
            vm.unreadNotificationCount = null;

            var $notificationsTable = $('#notificationsTable');
            var requestParams = {
                pageIndex: 1,
                pageSize: 10
            };

            vm.setAllNotificationsAsRead = function () {
                appUserNotificationHelper.setAllAsRead(function () {
                    vm.getNotifications();
                });
            };

            vm.setNotificationAsRead = function (notification) {
                appUserNotificationHelper.setAsRead(notification.notificationId, function () {
                    notification.state = 'READ';
                });
            };

            function createRequestParams() {
                var params = {};
                var state = null;

                if (vm.readStateFilter === 'UNREAD') {
                    state = infrastructure.notifications.notificationState.UNREAD;
                }
                params.state = state;
                return params;
            }

            vm.getNotifications = function () {
                $notificationsTable.table().data("canknow.table").load(createRequestParams());
            };
            $notificationsTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: notificationService.getUserNotifications,
                        callback: function (result) {
                            vm.unreadNotificationCount = result.unreadCount;
                            vm.notifications = [];

                            $.each(result.items, function (index, item) {
                                vm.notifications.push(appUserNotificationHelper.format(item));
                            });
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                }
            });
        }
    ]);
})();