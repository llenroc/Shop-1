(function () {
    appModule.controller('app.manager.host.tenant.edit', [
        '$scope', 'infrastructure.services.app.tenant', 'infrastructure.services.app.commonLookup', '$stateParams','$state',
        function ($scope, tenantService, commonLookupService, $stateParams, $state) {
            var vm = this;
            vm.saving = false;
            vm.tenant = null;
            vm.editions = [];
            vm.save = function () {

                if (vm.tenant.editionId == 0) {
                    vm.tenant.editionId = null;
                }
                vm.saving = true;
                tenantService.updateTenant(vm.tenant)
                    .then(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("host.tenant.index");
                    }).finally(function () {
                        vm.saving = false;
                    });
            };
            vm.getEditionValue = function (item) {
                return parseInt(item.value);
            };
            function init() {
                commonLookupService.getEditionsForCombobox({}).then(function (result) {
                    vm.editions = result.data.items;
                    vm.editions.unshift({ value: "0", displayText: app.localize('NotAssigned') });
                });
                tenantService.getTenantForEdit({
                    id: $stateParams.id
                }).then(function (result) {
                    vm.tenant = result.data;
                    vm.currentConnectionString = result.data.connectionString;
                    vm.tenant.editionId = vm.tenant.editionId || 0;
                });
            }
            init();
        }
    ]);
})();