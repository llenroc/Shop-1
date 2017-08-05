(function () {
    appModule.controller('app.mobile.areaAgency.certificate',
        ['$scope', 'infrastructure.services.app.areaAgencyForFront', 'appSession',
        function ($scope, areaAgencyService, appSession) {
            var vm = this;
            vm.certificate = null;
            vm.areaAgentId = document.getElementById("areaAgentId").value;
            vm.getCertificate = function () {
                areaAgencyService.getCertificate({ id: vm.areaAgentId }).success(function (result) {
                    vm.certificate = result;
                });
            };
            vm.reCreate = function () {
                infrastructure.ui.setBusy();
                areaAgencyService.reCreateCertificate({ id: vm.areaAgentId }).success(function (result) {
                    infrastructure.message.success(app.localize("ReCreateSuccessfully"));
                    vm.certificate = result;
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            function initialize() {
                vm.getCertificate();
            }
            initialize();
        }
        ]);
})();