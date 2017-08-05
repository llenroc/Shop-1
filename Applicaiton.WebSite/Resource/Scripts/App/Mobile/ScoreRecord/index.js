(function () {
    var controllerId = 'app.mobile.scoreRecord.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.scoreRecordForFront',
        function ($scope, scoreRecordService) {
            var vm = this;
            vm.scoreRecords = [];
            vm.isLoaded = false;
            var $scoreRecordList = $('#scoreRecordList');
            $scoreRecordList.table({
                paging: true,
                onInitializeLoadSuccess: function () {
                    vm.isLoaded = true;
                },
                actions: {
                    listAction: {
                        method: scoreRecordService.getAllOfPage,
                        callback: function (result) {
                            vm.scoreRecords = result.items;
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