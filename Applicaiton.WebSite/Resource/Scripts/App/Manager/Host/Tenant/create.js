(function () {
    appModule.controller('app.manager.host.tenant.create', [
        '$scope', 'infrastructure.services.app.tenant', 'infrastructure.services.app.commonLookup', '$state',
        function ($scope, tenantService, commonLookupService, $state) {
            var vm = this;
            vm.saving = false;
            vm.setRandomPassword = true;
            vm.useHostDb = true;
            vm.editions = [];
            vm.tenant = {
                isActive: true,
                shouldChangePasswordOnNextLogin: true,
                sendActivationEmail: true,
                editionId: 0
            };
            vm.getEditionValue = function (item) {
                return parseInt(item.value);
            };
            vm.save = function () {

                if (vm.setRandomPassword) {
                    vm.tenant.adminPassword = null;
                }

                if (vm.tenant.editionId == 0) {
                    vm.tenant.editionId = null;
                }
                vm.saving = true;
                tenantService.createTenant(vm.tenant)
                    .then(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("host.tenant.index");
                    }).finally(function () {
                        vm.saving = false;
                    });
            };
            commonLookupService.getEditionsForCombobox({}).then(function (result) {
                vm.editions = result.data.items;
                vm.editions.unshift({ value: "0", displayText: app.localize('NotAssigned') });
                commonLookupService.getDefaultEditionName({}).then(function (result) {
                    var defaultEdition = _.where(vm.editions, { displayText: result.data });

                    if (defaultEdition && defaultEdition.length) {
                        vm.tenant.editionId = parseInt(_.where(vm.editions, { displayText: 'Standard' })[0].value);
                    }
                });
            });
        }
    ]);
})();