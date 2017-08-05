(function () {
    var controllerId = 'app.manager.order.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productOrderAdmin', '$state', '$uiModal',
            function ($scope, orderService, $state, $uiModal) {
                var vm = this;
                vm.orders = [];
                vm.orderStatus = 1;
                vm.isLoading = false;
                vm.isExporting = false;
                var $ordersTable = $('#ordersTable');
                var $filterForm = $('#orderFilterForm');

                $ordersTable.table({
                    paging: true,
                    sorting: true,
                    multiSorting: true,
                    initializeLoad:false,
                    actions: {
                        listAction: {
                            method: orderService.getAllOfPage,
                            beforeCallback: function () {
                                vm.isLoading = true;
                                infrastructure.ui.setBusy();
                            },
                            callback: function (result) {
                                vm.orders = result.items;
                                vm.isLoading = false;
                                infrastructure.ui.clearBusy();
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            }
                        }
                    },
                    fields: {
                        number: {
                        },
                        title: {
                        },
                        customerInfo: {
                            disabled:true
                        },
                        money: {
                        },
                        shipInfo: {
                            disabled: true
                        },
                        orderStatus: {
                        },
                        creationTime: {
                        }
                    }
                });

                function createRequestParams() {
                    var params = {};
                    $filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                    return params;
                }

                vm.getOrders = function (orderStatus) {
                    var params = createRequestParams();

                    if (orderStatus!==null) {
                        vm.orderStatus = orderStatus;
                        params.orderStatus = orderStatus;
                    }
                    $ordersTable.table().data("canknow.table").load(params);
                };

                vm.changePayMoney = function (order) {
                    var modalInstance = $uiModal.open({
                        templateUrl: '/Areas/Manager/Views/Tenant/Order/ChangePayMoneyModal.cshtml',
                        controller: 'app.manager.order.changePayMoneyModal as vm',
                        resolve: {
                            id: function () {
                                return order.id;
                            }
                        }
                    });

                    modalInstance.result.then(function (result) {
                        vm.getOrders(vm.orderStatus);
                    });
                };
                vm.setAsPayed = function (order) {
                    orderService.setAsPayed({
                        id: order.id
                    }).success(function () {
                        vm.getOrders(vm.orderStatus);
                    });
                };
                vm.refund = function (order) {
                    orderService.refund({
                        id:order.id
                    }).success(function () {
                        vm.getOrders(vm.orderStatus);
                    });
                };
                vm.openBatchShipModal = function () {
                    var modalInstance = $uiModal.open({
                        templateUrl: '/Areas/Manager/Views/Tenant/Order/BatchShipModal.cshtml',
                        controller: 'app.manager.order.batchShipModal as vm',
                    });
                    modalInstance.result.then(function (result) {
                        vm.getOrders(vm.orderStatus);
                    });
                };
                vm.shipOrder = function (order) {
                    var modalInstance = $uiModal.open({
                        templateUrl: '/Areas/Manager/Views/Tenant/Order/ShipModal.cshtml',
                        controller: 'app.manager.order.shipModal as vm',
                        resolve: {
                            id: function () {
                                return order.id;
                            }
                        }
                    });

                    modalInstance.result.then(function (result) {
                        vm.getOrders(vm.orderStatus);
                    });
                };
                vm.exportToExcel = function () {
                    vm.isExporting = true;
                    orderService.getOrdersToExcel({}).then(function (result) {
                        app.downloadTempFile(result.data);
                    }).finally(function () {
                        vm.isExporting = false;
                    });
                };

                function initialize() {
                    vm.getOrders(vm.orderStatus);
                }
                initialize();
            }
        ]);
})();