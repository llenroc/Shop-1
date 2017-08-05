(function () {
    var controllerId = 'app.mobile.order.confirmOrderForShopCart';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.productOrder',
        function ($scope,orderService) {
            var vm = this;
            vm.boughtItems = [];
            vm.customerInfo = null;
            vm.noteOfCustomer = null;
            vm.money = 0;
            vm.getBoughtItems = function () {
                orderService.getBoughtItemsFromShopCart().success(function (result) {
                    vm.boughtItems = result;
                    vm.confirmOrder();
                });
            };
            vm.confirmOrder = function () {
                var data = {
                    boughtItems: vm.boughtItems,
                    customerInfoId: document.getElementById("customerInfoId").value,
                };
                infrastructure.ui.setBusy();
                orderService.confirmOrder(data).success(function (result) {
                    vm.boughtItems = result.boughtItems;
                    vm.money = result.money;
                    vm.customerInfo = result.customerInfo;
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.submit = function () {
                var data = {
                    boughtItems: vm.boughtItems,
                    noteOfCustomer: vm.noteOfCustomer,
                    customerInfoId: vm.customerInfo ? vm.customerInfo.id : null
                };
                var loading=infrastructure.ui.loading(app.localize("Submitting"));
                orderService.createOrder(data).success(function (result) {
                    window.location.href = "/Mobile/Pay/Index?id=" + result.id;
                }).error(function () {
                    loading.hide();
                });
            };
            vm.getTotalMoney = function () {
                var money = 0;
                vm.boughtItems.forEach(function (boughtItem) {
                    money += boughtItem.money;
                });
                return money;
            };
            function initialize() {
                vm.getBoughtItems();
            };
            initialize();
        }]);
})();