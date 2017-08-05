(function () {
    appModule.controller('app.manager.virtualProduct.virtualCard.index', ['$scope', 'infrastructure.services.app.virtualCard',
        function ($scope, virtualCardService) {
            var vm = this;
            vm.virtualCards = [];
            var $virtualCardTable = $('#virtualCardTable');
            $virtualCardTable.table({
                paging: true,
                sorting: true,
                actions: {
                    listAction: {
                        method: virtualCardService.getVirtualCardGroups,
                        callback: function (result) {
                            vm.virtualCards = result.items;
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