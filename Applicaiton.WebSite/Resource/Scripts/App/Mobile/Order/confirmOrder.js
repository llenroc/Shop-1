(function () {
    var controllerId = 'app.mobile.order.confirmOrder';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.productOrder',
        function ($scope,orderService) {
            var vm = this;
            vm.boughtItems = [];
            vm.isNeedLogistics = false;
            vm.loaded = false;
            vm.customerInfo = null;
            vm.customCustomerInfos = [];
            vm.noteOfCustomer = null;
            vm.money = 0;
            vm.postage = 0;
            vm.changeCount = function (boughtItem) {

                if (boughtItem.count <= 0) {
                    boughtItem.count = 1;
                }

                if (boughtItem.count > boughtItem.specification.stock) {
                    boughtItem.count = boughtItem.specification.stock;
                }
                vm.confirmOrder();
            };
            vm.confirmOrder = function () {
                var data;

                if (vm.boughtItems.length) {
                    data = {
                        boughtItems: vm.boughtItems,
                        customerInfoId: document.getElementById("customerInfoId").value,
                    };
                }
                else {
                    data = {
                        boughtItems: [
                            {
                                specificationId: document.getElementById("specificationId").value,
                                count: document.getElementById("count").value,
                            }
                        ],
                        customerInfoId: document.getElementById("customerInfoId").value,
                    };
                }
                infrastructure.ui.setBusy();
                orderService.confirmOrder(data).success(function (result) {
                    vm.boughtItems = result.boughtItems;
                    vm.money = result.money;
                    vm.postage = result.postage;
                    vm.customerInfo = result.customerInfo;
                    vm.customCustomerInfos = result.customCustomerInfos;
                    vm.isNeedLogistics = result.isNeedLogistics;
                    vm.loaded = true;
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.decreaseCount = function (boughtItem) {
                var count = boughtItem.count - 1;

                if (count <= 0) {
                    return false;
                }
                boughtItem.count--;
                vm.confirmOrder();
            };
            vm.increaseCount = function (boughtItem) {
                var count = boughtItem.count + 1;

                if (count > boughtItem.specification.stock) {
                    return false;
                }
                boughtItem.count++;
                vm.confirmOrder();
            };
            vm.submit = function () {
                var data = {
                    boughtItems: [{
                        specificationId: vm.boughtItems[0].specificationId,
                        count: vm.boughtItems[0].count,
                    }],
                    noteOfCustomer: vm.noteOfCustomer,
                    customerInfoId: vm.customerInfo ? vm.customerInfo.id : null
                };
                data.orderCustomCustomerInfos = vm.customCustomerInfos.map(function (customCustomerInfo) {
                    return {
                        customCustomerInfoId: customCustomerInfo.id,
                        value: customCustomerInfo.value
                    };
                });
                var loading = infrastructure.toast.loading(app.localize("Submitting"));

                orderService.createOrder(data).success(function (result) {
                    window.location.href = "/Mobile/Pay/Index?id=" + result.id;
                }).error(function () {
                    loading.hide();
                });
            };
            function initialize() {
                vm.confirmOrder();
            };
            initialize();
        }]);
})();