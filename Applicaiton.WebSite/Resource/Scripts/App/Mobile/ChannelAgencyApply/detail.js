(function () {
    appModule.controller('app.mobile.channelAgencyApply.detail',
        ['$scope', 'infrastructure.services.app.channelAgencyApplyForFront', 'appSession',
        function ($scope, channelAgencyApplyService, appSession) {
            var vm = this;
            vm.user = appSession.user;
            vm.id = document.getElementById("id").value;
            vm.channelAgencyApply = null;
            vm.getChannelAgencyApply = function () {
                channelAgencyApplyService.get({ id: vm.id }).success(function (result) {
                    vm.channelAgencyApply = result;
                });
            };
            vm.pay = function () {
                window.location.href = "/Mobile/Pay/Index?id=" + vm.channelAgencyApply.orderId;
            };
            vm.cancel = function () {
                infrastructure.ui.setBusy();
                channelAgencyApplyService.cancel({
                    id: vm.channelAgencyApply.id
                }).success(function (result) {
                    window.location.href = "/Mobile/ChannelAgent/Index";
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            function initialize() {
                vm.getChannelAgencyApply();
            }
            initialize();
        }
        ]);
})();