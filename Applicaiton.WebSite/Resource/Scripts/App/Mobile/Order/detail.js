(function () {
    var controllerId = 'app.mobile.order.detail';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.productOrder', 'infrastructure.services.app.logistics',
        function ($scope, orderService, logisticsService) {
            var vm = this;
            vm.id = document.getElementById("id").value;
            vm.order = null;
            vm.isDeleting = false;
            vm.isReceiving = false;
            vm.logistics = null;
            vm.getOrder = function () {
                orderService.get({
                    id: vm.id
                }).success(function (result) {
                    vm.order = result;

                    if (vm.order.expressCompanyId && vm.order.trackingNumber) {
                        vm.getLogistics();
                    }
                }).finally(function () {
                });
            };
            vm.getLogistics = function () {
                logisticsService.getExpresLogisticss({
                    expressCompanyId: vm.order.expressCompanyId,
                    trackingNumber: vm.order.trackingNumber
                }).success(function (result) {
                    vm.logistics = JSON.parse(result.logistics);
                });
            };
            vm.receive = function () {
                infrastructure.ui.setBusy();
                vm.isReceiving = true;
                orderService.receive({
                    id: vm.order.id
                }).success(function (result) {
                    window.location.href = "/Mobile/Order/Index";
                }).finally(function () {
                    vm.isReceiving = false;
                    infrastructure.ui.clearBusy();
                });
            };
            vm.closeOrder = function () {
                infrastructure.ui.setBusy();
                vm.isDeleting = true;
                orderService.closeOrder({
                    id: vm.order.id
                }).success(function (result) {
                    window.location.href = "/Mobile/Order/Index";
                }).finally(function () {
                    vm.isDeleting = false;
                    infrastructure.ui.clearBusy();
                });
            };
            function initialize() {
                vm.getOrder();
            }
            initialize();
        }]);
})();