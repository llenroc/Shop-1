(function () {
    appModule.controller('app.manager.logistics.detail',
        ['$scope', 'infrastructure.services.app.logistics', '$stateParams', 
        function ($scope, logisticsService, $stateParams) {
            var vm = this;
            vm.logistics = null;
            vm.expressCompany = null;
            vm.expressCompanyId = document.getElementById("expressCompanyId").value;
            vm.trackingNumber = document.getElementById("trackingNumber").value;
            vm.getLogistics = function () {
                logisticsService.getExpresLogisticss({
                    expressCompanyId: vm.expressCompanyId,
                    trackingNumber: vm.trackingNumber
                }).success(function (result) {
                    vm.logistics = JSON.parse(result.logistics);
                    vm.expressCompany = result.expressCompany;
                });
            };
            function initialize() {
                vm.getLogistics();
            }
            initialize();
        }
        ]);
})();