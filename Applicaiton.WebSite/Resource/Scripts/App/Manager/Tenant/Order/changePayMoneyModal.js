(function () {
    var controllerId = 'app.manager.order.changePayMoneyModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productOrderAdmin', '$uiModalInstance', 'id',
            function ($scope, orderService, $uiModalInstance, id) {
                var vm = this;
                vm.order = null;
                vm.saving = false;

                function initialize() {
                    orderService.getOrderForEditOutput({ id: id }).success(function (result) {
                        vm.order = result.order;
                    });
                }

                vm.save = function () {
                    vm.saving = true;
                    orderService.changePayMoney(vm.order).then(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $uiModalInstance.close();
                    }).finally(function () {
                        vm.saving = false;
                    });
                };
                initialize();
            }
        ]);
})();