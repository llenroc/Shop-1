(function () {
    var controllerId = 'app.manager.tenant.setting.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.tenantSettings', function ($scope, tenantSettingsService) {
            var vm = this;
            vm.settings = null;
            vm.distributionWhens = [
                {
                    name: app.localize("Payed"),
                    value: "Payed",
                },
                {
                    name: app.localize("Receipt"),
                    value: "Receipt",
                },
                {
                    name: app.localize("Complete"),
                    value: "Complete",
                }
            ];
            vm.decreaseStockWhens = [
                {
                    name: app.localize("Create"),
                    value: "Create",
                },
                {
                    name: app.localize("Pay"),
                    value: "Pay",
                },
            ]
            vm.loading = false;
            vm.getSettings = function () {
                vm.loading = true;
                tenantSettingsService.getAllSettings().then(function (result) {
                    vm.settings = result.data;
                }).finally(function () {
                    vm.loading = false;
                });
            };

            vm.saveAll = function () {
                tenantSettingsService.updateAllSettings(vm.settings).then(function () {
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