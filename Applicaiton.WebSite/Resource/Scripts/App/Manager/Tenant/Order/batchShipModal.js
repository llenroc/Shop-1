(function () {
    var controllerId = 'app.manager.order.batchShipModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productOrderAdmin', 'infrastructure.services.app.expressCompany', '$uiModalInstance',
            function ($scope, orderService,expressCompanyService, $uiModalInstance) {
                var vm = this;
                vm.shipData = null;
                vm.expressCompanys = [];
                vm.isShipping = false;
                function initialize() {
                    expressCompanyService.getAll().success(function (result) {
                        vm.expressCompanys = result.items;
                    });
                }
                vm.ship = function () {
                    vm.isShipping = true;
                    infrastructure.ui.setBusy();
                    orderService.bathShipFromExcel(vm.shipData).success(function (result) {
                        infrastructure.notify.info(app.localize('BatchShipedSuccessfully'));
                        $uiModalInstance.close();
                    }).finally(function () {
                        vm.isShipping = false;
                        infrastructure.ui.clearBusy();
                    });
                };
                initialize();
            }
        ]);
})();