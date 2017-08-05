(function () {
    var controllerId = 'app.mobile.areaAgency.areaAgencyAreas';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.areaAgencyForFront', '$stateParams', '$state',
            function ($scope, areaAgencyService, $stateParams, $state) {
                var vm = this;
                vm.areaAgencyAreas = null;
                vm.areaAgencyId = document.getElementById("areaAgencyId").value;
                vm.developLevel = document.getElementById("developLevel").value;
                vm.getAreaAgencyAreas = function () {
                    areaAgencyService.getAreaAgencyAreas({
                        areaAgencyId: vm.areaAgencyId,
                        developLevel:vm.developLevel
                    }).success(function (result) {
                        vm.areaAgencyAreas = result.items;
                    });
                };
                function initialize() {
                    vm.getAreaAgencyAreas();
                }
                initialize();
            }
        ]);
})();