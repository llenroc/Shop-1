(function () {
    appModule.controller('app.mobile.channelAgency.index',
        ['$scope', 'infrastructure.services.app.channelAgencyForFront', 'appSession',
        function ($scope, channelAgencyService, appSession) {
            var vm = this;
            vm.user = appSession.user;
            vm.channelAgency = null;
            vm.totalRebate = 0;
            vm.getChannelAgency = function () {
                channelAgencyService.getChannelAgency().success(function (result) {
                    vm.channelAgency = result.channelAgency;
                    vm.totalRebate = result.totalRebate;
                });
            }
            function initialize() {

                if (vm.user.isChannelAgency) {
                    vm.getChannelAgency();
                }
            }
            initialize();
        }
        ]);
})();