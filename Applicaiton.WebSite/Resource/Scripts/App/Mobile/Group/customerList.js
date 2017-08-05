(function () {
    appModule.controller('app.mobile.group.customerList',
        ['$scope', 'infrastructure.services.app.group', 'appSession',
        function ($scope, groupService, appSession) {
            var vm = this;
            vm.customers = null;
            vm.depth = document.getElementById("depth").value;
            var $customerList = $('#groupCustomerList');
            $customerList.table({
                paging: true,
                pageSize: 5,
                initializeLoad: false,
                actions: {
                    listAction: {
                        method: groupService.getCustomers,
                        beforeCallback: function () {
                            infrastructure.ui.setBusy();
                        },
                        callback: function (result) {
                            infrastructure.ui.clearBusy();
                            vm.customers = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                }
            });
            function createRequestParams() {
                var params = { depth: vm.depth };
                return params;
            }
            vm.getCustomers = function () {
                $customerList.table().data("canknow.table").load(createRequestParams());
            };
            function initialize() {
                vm.getCustomers();
            }
            initialize();
        }
        ]);
})();