(function () {
    var controllerId = 'app.manager.order.shipModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productOrderAdmin', '$uiModalInstance', 'id',
            function ($scope, orderService, $uiModalInstance,id) {
                var vm = this;
                vm.order = null;
                vm.expressInfo = null;
                vm.expressCompanys = [];

                function initialize() {
                    orderService.getOrderForShipOutput({ id: id }).success(function (result) {
                        vm.order = result.order;
                        vm.expressCompanys = result.expressCompanys;
                    });
                };
                vm.ship = function () {
                    orderService.ship({orderId:id, expressInfo: vm.expressInfo }).success(function (result) {
                        infrastructure.notify.info(app.localize('ShipSuccessfully'));
                        $uiModalInstance.close();
                    }).finally(function () {
                    });
                };
                initialize();
            }
        ]);
})();