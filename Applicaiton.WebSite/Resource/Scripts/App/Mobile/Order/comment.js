(function () {
    var controllerId = 'app.mobile.order.comment';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.productOrder',
        function ($scope, orderService) {
            var vm = this;
            vm.id = document.getElementById("id").value;
            vm.order = null;
            vm.getOrder = function () {
                orderService.getOrderForComment({
                    id: vm.id
                }).success(function (result) {
                    vm.order = result;
                }).finally(function () {

                });
            };
            vm.comment = function (index) {
                var orderItem = vm.order.orderItems[index];
                orderService.comment({
                    orderItemId: orderItem.id,
                    content: orderItem.comment.content
                }).success(function (result) {
                    vm.order.orderItems[index] = result;
                }).finally(function () {

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
            function initialize() {
                vm.getOrder();
            }
            initialize();
        }]);
})();