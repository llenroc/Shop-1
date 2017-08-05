(function () {
    appModule.controller('app.mobile.channelAgency.certificate',
        ['$scope', 'infrastructure.services.app.channelAgencyForFront', 'appSession',
        function ($scope, channelAgencyService, appSession) {
            var vm = this;
            vm.certificate = null;
            vm.getCertificate = function () {
                channelAgencyService.getCertificate().success(function (result) {
                    vm.certificate = result;
                });
            };
            vm.reCreate = function () {
                infrastructure.ui.setBusy();
                channelAgencyService.reCreateCertificate().success(function (result) {
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