(function () {
    var controllerId = 'app.mobile.spread.qrcode';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.spread', 'appSession',
        function ($scope, spreadService, appSession) {
            var vm = this;
            vm.qrcode = null;
            vm.user = appSession.user;
            vm.getQrcode = function () {
                spreadService.getQrcode().success(function (result) {
                    vm.qrcode = result;
                });
            };
            vm.reCreate = function () {
                infrastructure.ui.setBusy();
                spreadService.reCreateQrcode().success(function (result) {
                    infrastructure.message.success(app.localize("ReCreateSuccessfully"));
                    vm.qrcode = result;
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            function initiallize() {
                vm.getQrcode();
            }
            initiallize();
        }]);
})();