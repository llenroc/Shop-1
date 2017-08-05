(function () {
    appModule.controller('app.mobile.areaAgency.index',
        ['$scope', 'infrastructure.services.app.areaAgencyForFront', 'appSession',
        function ($scope, areaAgencyService, appSession) {
            var vm = this;
            vm.user = appSession.user;
            vm.areaAgency = null;
            vm.normalAddressCount = 0;
            vm.developedAddressCount = 0;
            vm.totalRebate = 0;
            vm.customerCount = 0;
            vm.id = document.getElementById("id").value;
            vm.getAreaAgency = function () {
                areaAgencyService.getAreaAgency({id:vm.id}).success(function (result) {
                    vm.areaAgency = result.areaAgency;
                    vm.normalAddressCount = result.normalAddressCount;
                    vm.developedAddressCount = result.developedAddressCount;
                    vm.totalRebate = result.totalRebate;
                    vm.customerCount = result.customerCount;
                });
            }
            function initialize() {
                vm.getAreaAgency();
            }
            initialize();
        }
        ]);
})();