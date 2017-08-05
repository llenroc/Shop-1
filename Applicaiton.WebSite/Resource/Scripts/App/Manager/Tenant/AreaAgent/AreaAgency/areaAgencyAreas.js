(function () {
    var controllerId = 'app.manager.areaAgent.areaAgency.areaAgencyAreas';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.areaAgencyForEnd', '$stateParams', '$state',
            function ($scope, areaAgencyService, $stateParams, $state) {
                var vm = this;
                vm.areaAgencyAreas = null;
                vm.getAreaAgencyAreas = function () {
                    areaAgencyService.getAreaAgencyAreas({ id: $stateParams.id }).success(function (result) {
                        vm.areaAgencyAreas = result.items;
                    });
                };
                vm.delete = function (index) {
                    infrastructure.message.confirm(
                        app.localize('SureDelete'),
                        function () {
                            areaAgencyService.deleteAreaAgencyAreas({ id: vm.areaAgencyAreas[index].id }).success(function (result) {
                                infrastructure.notify.success(app.localize('DeletedSuccessfully'));
                                vm.areaAgencyAreas.splice(index, 1);
                            });
                        }
                    );
                };
                function initialize() {
                    vm.getAreaAgencyAreas();
                }
                initialize();
            }
        ]);
})();