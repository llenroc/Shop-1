(function () {
    appModule.controller('app.manager.score.score.index', ['$scope', 'infrastructure.services.app.scoreForEnd',
        function ($scope, scoreService) {
            var vm = this;
            vm.scores = [];
            var $scoreTable = $('#scoreTable');
            $scoreTable.table({
                paging: true,
                sorting: true,
                actions: {
                    listAction: {
                        method: scoreService.getAllOfPage,
                        callback: function (result) {
                            vm.scores = result.items;
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