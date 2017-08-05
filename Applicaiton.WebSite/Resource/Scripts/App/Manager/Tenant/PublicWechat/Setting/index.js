(function () {
    var controllerId = 'app.manager.publicWechat.setting.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.publicWechatSettings', 'infrastructure.services.app.publicWechat',
            function ($scope,publicWechatSettingsService, publicWechatService) {
                var vm = this;
                vm.settings = null;
                vm.loading = false;
                vm.getSettings = function () {
                    vm.loading = true;
                    publicWechatSettingsService.getSettings().then(function (result) {
                        vm.settings = result.data;
                    }).finally(function () {
                        vm.loading = false;
                    });
                };
                vm.refreshAccessToken = function () {
                    infrastructure.ui.setBusy();
                    publicWechatService.refreshAccessToken().then(function (result) {
                    }).finally(function () {
                        infrastructure.ui.clearBusy();
                    });
                }
                vm.saveAll = function () {
                    publicWechatSettingsService.updateSettings(vm.settings).then(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                    });
                };
                vm.init = function () {
                    vm.getSettings();
                };
                vm.init();
            }
        ]);
})();