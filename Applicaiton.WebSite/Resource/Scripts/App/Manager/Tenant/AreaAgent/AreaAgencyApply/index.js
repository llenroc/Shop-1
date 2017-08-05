(function () {
    appModule.controller('app.manager.areaAgent.areaAgencyApply.index',
        ['$scope', 'infrastructure.services.app.areaAgencyApplyForEnd',
        function ($scope, areaAgencyApplyService) {
            var vm = this;
            vm.areaAgencyApplys = [];
            var $areaAgencyApplyTable = $('#areaAgencyApplyTable');
            $areaAgencyApplyTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: areaAgencyApplyService.getAllOfPage,
                        callback: function (result) {
                            vm.areaAgencyApplys = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                }
            }).data("canknow.table");
            vm.pass = function (areaAgencyApply) {
                infrastructure.ui.setBusy();
                areaAgencyApplyService.passAreaAgencyApply({ id: areaAgencyApply.id }).success(function (result) {
                    infrastructure.message.success(app.localize("PassSuccessfully"));
                    vm.getAreaAgencys();
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.getAreaAgencys=function() {
                $areaAgencyApplyTable.table().data("canknow.table").load();
            }
        }
    ]);
})();