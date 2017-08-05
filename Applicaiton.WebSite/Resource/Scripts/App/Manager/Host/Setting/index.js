(function () {
    var controllerId = 'app.manager.host.setting.index';
    appModule.controller(controllerId,
        ['$scope', 'appSession', 'infrastructure.services.app.hostSettings', function ($scope, appSession,hostSettingsService) {
            var vm = this;
            vm.settings = null;
            vm.loading = false;
            vm.testEmailAddress = appSession.user.emailAddress;

            vm.getSettings = function () {
                vm.loading = true;
                hostSettingsService.getAllSettings().then(function (result) {
                    vm.settings = result.data;
                    }).finally(function () {
                        vm.loading = false;
                    });
            };

            vm.saveAll = function () {
                hostSettingsService.updateAllSettings(vm.settings).then(function () {
                    infrastructure.notify.info(app.localize('SavedSuccessfully'));
                });
            };

            vm.sendTestEmail = function () {
                hostSettingsService.sendTestEmail({
                    emailAddress: vm.testEmailAddress
                }).then(function () {
                    infrastructure.notify.info(app.localize('TestEmailSentSuccessfully'));
                });
            };

            vm.init = function () {
                vm.getSettings();
            };
            vm.init();
        }
    ]);
})();