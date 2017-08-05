(function () {
    appModule.controller('app.manager.channel.channelAgencyApply.index',
        ['$scope', 'infrastructure.services.app.channelAgencyApplyForEnd',
        function ($scope, channelAgencyApplyService) {
            var vm = this;
            vm.channelAgencyApplys = [];
            var $channelAgencyApplyTable = $('#channelAgencyApplyTable');
            $channelAgencyApplyTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: channelAgencyApplyService.getAllOfPage,
                        callback: function (result) {
                            vm.channelAgencyApplys = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                }
            }).data("canknow.table");

            vm.pass = function (channelAgencyApply) {
                channelAgencyApplyService.passChannelAgencyApply({ id: channelAgencyApply.id }).success(function (result) {
                    infrastructure.message.success(app.localize("PassSuccessfully"));
                    vm.getChannelAgencys();
                });
            };
            vm.getChannelAgencys=function() {
                $channelAgencyApplyTable.table().data("canknow.table").load();
            }
        }
    ]);
})();