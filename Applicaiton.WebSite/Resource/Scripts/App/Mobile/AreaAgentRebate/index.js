(function () {
    var controllerId = 'app.mobile.areaAgentRebate.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.areaAgentRebateForFront', '$stateParams', '$state',
            function ($scope, areaAgentRebateService, $stateParams, $state) {
                var vm = this;
                vm.areaAgencyAreas = null;
                vm.areaAgencyId = document.getElementById("areaAgencyId").value;
                vm.areaAgentRebates = [];
                vm.getAreaAgentRebates = function () {
                    areaAgentRebateService.getAllOfPage({
                        areaAgencyId: vm.areaAgencyId,
                    }).success(function (result) {
                        vm.areaAgentRebates = result.items;
                    });
                };
                function initialize() {
                    vm.getAreaAgentRebates();
                }
                initialize();
            }
        ]);
})();