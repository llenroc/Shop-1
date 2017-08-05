(function () {
    appModule.controller('app.manager.channel.channelAgency.index',
        ['$scope', 'infrastructure.services.app.channelAgencyForEnd',
        function ($scope, channelAgencyService) {
            var vm = this;
            vm.channelAgencys = [];
            var $channelAgencyTable = $('#channelAgencyTable');
            $channelAgencyTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: channelAgencyService.getAllOfPage,
                        callback: function (result) {
                            vm.channelAgencys = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                }
            });
            function getChannelAgencys() {
                $channelAgencyTable.table().data("canknow.table").load();
            }
        }
    ]);
})();