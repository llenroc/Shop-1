(function () {
    var controllerId = 'app.mobile.channelAgentRebate.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.channelAgentRebate',
        function ($scope, channelAgentRebateService) {
            var vm = this;
            vm.channelAgentRebates = [];
            var $channelAgentRebateList = $('#channelAgentRebateList');
            $channelAgentRebateList.table({
                paging: true,
                actions: {
                    listAction: {
                        method: channelAgentRebateService.getAllOfPage,
                        callback: function (result) {
                            vm.channelAgentRebates = result.items;
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