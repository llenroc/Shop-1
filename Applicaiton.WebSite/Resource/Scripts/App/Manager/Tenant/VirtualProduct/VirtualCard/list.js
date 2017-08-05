(function () {
    appModule.controller('app.manager.virtualProduct.virtualCard.list',
        ['$scope', 'infrastructure.services.app.virtualCard', '$stateParams',
        function ($scope, virtualCardService,$stateParams) {
            var vm = this;
            vm.virtualCards = [];
            var $virtualCardTable = $('#virtualCardTable');
            var $filterForm = $('#virtualCardFilterForm');
            vm.statusEnum = [{
                value: 0,
                name: app.localize("Effective"),
            }, {
                value: 1,
                name: app.localize("Used"),
            }, {
                value: 2,
                name: app.localize("Overdue"),
            }];
            $virtualCardTable.table({
                paging: true,
                sorting: true,
                initializeLoad: false,
                actions: {
                    listAction: {
                        method: virtualCardService.getAllOfPage,
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
            function createRequestParams() {
                var params = { version: $stateParams.version };
                $filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                return params;
            }
            vm.getVirtualCards = function () {
                $virtualCardTable.table().data("canknow.table").load(createRequestParams());
            };
            function initialize() {
                vm.getVirtualCards();
            }
            initialize();
        }
        ]);
})();