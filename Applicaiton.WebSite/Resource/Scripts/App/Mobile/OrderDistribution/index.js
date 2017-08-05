(function () {
    var controllerId = 'app.mobile.orderDistribution.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.orderDistribution',
        function ($scope, orderDistributionService) {
            var vm = this;
            vm.orderDistributions = [];
            var $orderDistributionList = $('#orderDistributionList');

            $orderDistributionList.table({
                paging: true,
                actions: {
                    listAction: {
                        method: orderDistributionService.getAllOfPage,
                        callback: function (result) {
                            vm.orderDistributions = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                }
            });
            vm.localize = function (text) {
                return app.localize(text);
            };
            function createRequestParams() {
                var params = {};
                $filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                return params;
            }
        }]);
})();