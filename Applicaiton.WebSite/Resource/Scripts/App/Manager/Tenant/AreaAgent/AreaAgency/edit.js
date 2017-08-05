(function () {
    var controllerId = 'app.manager.areaAgent.areaAgency.edit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.areaAgencyForEnd', '$stateParams', '$state',
            function ($scope, areaAgencyService, $stateParams, $state) {
                var vm = this;
                vm.areaAgency = null;
                areaAgencyService.get({ id: $stateParams.id }).success(function (result) {
                    vm.areaAgency = result;
                });
                vm.save = function () {
                    areaAgencyService.update(vm.areaAgency).success(function (result) {
                        infrastructure.notify.success(app.localize('SavedSuccessfully'));
                        $state.go("area.areaAgency.index");
                    });
                };
            }
        ]);
})();