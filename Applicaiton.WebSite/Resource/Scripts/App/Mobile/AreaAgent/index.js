(function () {
    appModule.controller('app.mobile.areaAgent.index',
        ['$scope', 'infrastructure.services.app.areaAgentForFront', 'infrastructure.services.app.areaAgencyForFront', 'appSession',
        function ($scope, areaAgentService,areaAgencyService, appSession) {
            var vm = this;
            vm.areaAgents = null;
            vm.hasLoaded = false;
            vm.areaAgencys = [];
            vm.getAreaAgents = function () {
                areaAgentService.getAll().success(function (result) {
                    vm.areaAgents = result.items;
                }).finally(function () {
                    vm.hasLoaded = true;
                });
            };
            vm.getAreaAgencys = function () {
                areaAgencyService.getMyAreaAgencys().success(function (result) {
                    vm.areaAgencys = result.items;
                });
            };
            vm.hasAreaAgent = function (areaAgent) {

                for (var i in vm.areaAgencys) {

                    if (vm.areaAgencys[i].areaAgentId == areaAgent.id) {
                        return true;
                    }
                }
                return false;
            };
            vm.view = function (areaAgent) {
                window.location.href = "/Mobile/AreaAgency/Index?id=" + areaAgent.id;
            };
            vm.apply = function (areaAgent) {
                window.location.href = "/Mobile/AreaAgent/Apply?id=" + areaAgent.id;
            };
            function initialize() {
                vm.getAreaAgents();
                vm.getAreaAgencys();
            }
            initialize();
        }
        ]);
})();