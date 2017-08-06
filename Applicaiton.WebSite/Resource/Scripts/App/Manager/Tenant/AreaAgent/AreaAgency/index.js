(function () {
    appModule.controller('app.manager.areaAgent.areaAgency.index',
        ['$scope', 'infrastructure.services.app.areaAgencyForEnd', 'infrastructure.services.app.areaAgentForEnd',
        function ($scope, areaAgencyService,areaAgentService) {
            var vm = this;
            vm.areaAgencys = [];
            vm.areaAgents = [];
            vm.filter = {};
            var $filterForm = $('#areaAgencyFilterForm');
            var $areaAgencyTable = $('#areaAgencyTable');
            vm.getAreaAgents = function () {
                areaAgentService.getAll().success(function (result) {
                    vm.areaAgents = result.items;
                });
            }
            $areaAgencyTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: areaAgencyService.getAllOfPage,
                        callback: function (result) {
                            vm.areaAgencys = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    name: {
                        sorting: false
                    },
                    nickName: {
                        sorting: false
                    },
                    avatar:{
                        sorting: false
                    },
                    creationTime: {

                    }
                }
            });
            function createRequestParams() {
                return vm.filter;
            }
            vm.delete = function (id) {
                areaAgencyService.delete({ id: id }).success(function (result) {
                    vm.getAreaAgencys();
                });
            }
            vm.getAreaAgencys=function() {
                $areaAgencyTable.table().data("canknow.table").load(createRequestParams());
            }

            function initialize() {
                vm.getAreaAgents();
            }
            initialize();
        }
    ]);
})();