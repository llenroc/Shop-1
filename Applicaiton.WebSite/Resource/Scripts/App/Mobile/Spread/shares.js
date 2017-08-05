(function () {
    appModule.controller('app.mobile.spread.shares',
        ['$scope', 'infrastructure.services.app.share', 'appSession',
        function ($scope, shareService, appSession) {
            var vm = this;
            vm.shares = null;
            var $shareList = $('#shareList');
            $shareList.table({
                paging: true,
                pageSize: 5,
                initializeLoad: false,
                actions: {
                    listAction: {
                        method: shareService.getAllOfPage,
                        beforeCallback: function () {
                            infrastructure.ui.setBusy();
                        },
                        callback: function (result) {
                            infrastructure.ui.clearBusy();
                            vm.shares = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                }
            });
            function createRequestParams() {
                var params = {};
                return params;
            }
            vm.getShares = function () {
                $shareList.table().data("canknow.table").load(createRequestParams());
            };
            function initialize() {
                vm.getShares();
            }
            initialize();
        }
        ]);
})();