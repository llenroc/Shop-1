(function () {
    var controllerId = 'app.manager.order.detail';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productOrderAdmin', '$state', '$stateParams', '$uiModal',
            function ($scope, orderService, $state, $stateParams, $uiModal) {
                var vm = this;
                vm.order = null;
                vm.changeCustomerInfo = function (order) {
                    var modalInstance = $uiModal.open({
                        templateUrl: '/Areas/Manager/Views/Tenant/Order/ChangeCustomerInfoModal.cshtml',
                        controller: 'app.manager.order.changeCustomerInfoModal as vm',
                        resolve: {
                            id: function () {
                                return order.id;
                            }
                        }
                    });

                    modalInstance.result.then(function (result) {
                        vm.getOrder();
                    });
                }
                vm.getOrder = function () {
                    orderService.get({ id: $stateParams.id }).success(function (result) {
                        vm.order = result;
                    });
                }
                function initialize() {
                    vm.getOrder();
                }
                initialize();
            }
        ]);
})();