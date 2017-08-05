(function () {
    var controllerId = 'app.mobile.order.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.productOrder',
        function ($scope,orderService) {
            var vm = this;
            vm.orders = [];
            vm.isLoaded = false;
            vm.orderStatus = 1;
            var $ordersList = $('#ordersList');
            $ordersList.table({
                paging: true,
                pageSize: 5,
                initializeLoad: false,
                onInitializeLoadSuccess: function () {
                    vm.isLoaded = true;
                },
                actions: {
                    listAction: {
                        method: orderService.getAllOfPage,
                        beforeCallback:function(){
                            infrastructure.ui.setBusy();
                        },
                        callback: function (result) {
                            infrastructure.ui.clearBusy();
                            vm.orders = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                }
            });

            function createRequestParams(orderStatus) {
                vm.orderStatus = orderStatus;
                var params = { orderStatus:orderStatus};
                return params;
            }
            vm.getOrders = function (orderStatus) {
                $ordersList.table().data("canknow.table").load(createRequestParams(orderStatus));
            };
            function initialize() {
                vm.getOrders(vm.orderStatus);
            };
            initialize();
        }]);
})();