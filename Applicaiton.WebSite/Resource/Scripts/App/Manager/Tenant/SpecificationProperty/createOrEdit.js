(function () {
    var controllerId = 'app.manager.specificationProperty.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.specificationPropertyForTenant', '$stateParams', '$state',
            function ($scope, specificationPropertyForTenantService, $stateParams, $state) {
                var vm = this;
                vm.specificationProperty = null;
                vm.saving = false;
                vm.specificationPropertyTypes = [
                    { name: app.localize("Text"), value: 0 },
                    { name: app.localize("Color"), value: 1 },
                ];
                vm.addSpecificationProperty = function () {
                    vm.specificationProperty.specificationPropertys.push({
                        name: "",
                        type: vm.specificationPropertyTypes[0]
                    });
                };
                vm.createOrEdit = function () {
                    vm.saving = true;
                    specificationPropertyForTenantService.createOrEdit(vm.specificationProperty).then(function () {
                        infrastructure.notify.info(app.localize('CreateSuccessfully'));
                        $state.go("specificationProperty.index");
                    }).finally(function () {
                        vm.saving = false;
                    });
                };
                function init() {
                    specificationPropertyForTenantService.getSpecificationPropertyForCreateOrEdit({
                        id: $stateParams.id
                    }).success(function (result) {
                        vm.specificationProperty = result;
                    });
                }
                init();
            }
        ]);
})();