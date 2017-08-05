(function () {
    var controllerId = 'app.mobile.orderChannelAgentProductDistribution.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.orderChannelAgentProductDistribution',
        function ($scope, orderChannelAgentProductDistributionService) {
            var vm = this;
            vm.orderChannelAgentProductDistributions = [];
            var $orderChannelAgentProductDistributionList = $('#orderChannelAgentProductDistributionList');

            $orderChannelAgentProductDistributionList.table({
                paging: true,
                actions: {
                    listAction: {
                        method: orderChannelAgentProductDistributionService.getAllOfPage,
                        callback: function (result) {
                            vm.orderChannelAgentProductDistributions = result.items;
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