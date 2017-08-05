(function () {
    appModule.controller('app.mobile.channelAgent.index',
        ['$scope', 'infrastructure.services.app.channelAgentForFront', 'infrastructure.services.app.channelAgencyForFront', 'infrastructure.services.app.channelAgencyApplyOrder', 'appSession',
        function ($scope, channelAgentService,channelAgencyService,channelAgencyApplyOrderService, appSession) {
            var vm = this;
            vm.channelAgents = null;
            vm.hasLoaded = false;
            vm.channelAgency = null;
            vm.isApplying = false;
            vm.applyingChannelAgencyApply = null;
            vm.getMyChannelAgentInfo = function () {
                channelAgencyService.getMyChannelAgentInfo().success(function (result) {
                    vm.channelAgency = result.channelAgency;
                    vm.applyingChannelAgencyApply = result.applyingChannelAgencyApply;
                });
            };
            vm.isInApplying = function (channelAgent) {

                if (!vm.applyingChannelAgencyApply) {
                    return false;
                }
                else {
                    return vm.applyingChannelAgencyApply.channelAgentId == channelAgent.id;
                }
            };
            vm.viewOrder = function () {
                window.location.href = "/Mobile/ChannelAgencyApply/Detail?id=" + vm.applyingChannelAgencyApply.id;
            };
            vm.apply = function (channelAgent) {
                vm.isApplying = true;
                window.location.href = "/Mobile/ChannelAgent/Apply?channelAgentId=" + channelAgent.id;
            };
            vm.canApply = function (channelAgent) {

                if (vm.applyingChannelAgencyApply) {
                    return false;
                }

                if (vm.channelAgency) {
                    return channelAgent.level < vm.channelAgency.channelAgent.level;
                }
                else {
                    return true;
                }
            };
            vm.getChannelAgents = function () {
                channelAgentService.getAll().success(function (result) {
                    vm.channelAgents = result.items;
                }).finally(function () {
                    vm.hasLoaded = true;
                });
            };
            function initialize() {
                vm.getMyChannelAgentInfo();
                vm.getChannelAgents();
            }
            initialize();
        }
        ]);
})();