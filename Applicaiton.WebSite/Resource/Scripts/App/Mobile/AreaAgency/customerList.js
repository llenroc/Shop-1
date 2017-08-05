(function () {
    appModule.controller('app.mobile.areaAgency.customerList',
        ['$scope', 'infrastructure.services.app.areaAgencyForFront', 'appSession',
        function ($scope, areaAgencyService, appSession) {
            var vm = this;
            vm.customerInfos = null;
            vm.areaAgencyId = document.getElementById("areaAgencyId").value;
            var $areaAgencyCustomerList = $('#areaAgencyCustomerList');

            $areaAgencyCustomerList.table({
                paging: true,
                pageSize: 5,
                initializeLoad: false,
                actions: {
                    listAction: {
                        method: areaAgencyService.getCustomerInfos,
                        beforeCallback: function () {
                            infrastructure.ui.setBusy();
                        },
                        callback: function (result) {
                            infrastructure.ui.clearBusy();
                            vm.customerInfos = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                }
            });
            function createRequestParams() {
                var params = { areaAgencyId: vm.areaAgencyId };
                return params;
            }
            vm.getCustomerInfos = function () {
                $areaAgencyCustomerList.table().data("canknow.table").load(createRequestParams());
            };
            function initialize() {
                vm.getCustomerInfos();
            }
            initialize();
        }
        ]);
})();