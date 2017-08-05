(function () {
    appModule.controller('app.manager.notifications.setting', [
        '$scope', 'infrastructure.services.app.notification',
        function ($scope, notificationService) {
            var vm = this;
            vm.settings = null;
            vm.saving = false;
            vm.save = function () {
                vm.saving = true;
                vm.settings.notifications = vm.settings.notifications || [];
                notificationService.updateNotificationSettings(
                    vm.settings
                ).then(function () {
                    infrastructure.notify.info(app.localize('SavedSuccessfully'));
                }).finally(function () {
                    vm.saving = false;
                });
            };

            function init() {
                notificationService.getNotificationSettings({}).then(function (result) {
                    vm.settings = result.data;
                });
            }
            init();
        }
    ]);
})();