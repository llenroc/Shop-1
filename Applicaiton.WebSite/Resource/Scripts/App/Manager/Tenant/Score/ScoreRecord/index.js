(function () {
    appModule.controller('app.manager.score.scoreRecord.index', ['$scope', 'infrastructure.services.app.scoreRecordForEnd',
        function ($scope, scoreRecordService) {
            var vm = this;
            vm.scoreRecords = [];
            var $scoreRecordTable = $('#scoreRecordTable');
            $scoreRecordTable.table({
                paging: true,
                sorting: true,
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
                },
                fields: {
                    id: {
                    },
                }
            });
        }
    ]);
})();