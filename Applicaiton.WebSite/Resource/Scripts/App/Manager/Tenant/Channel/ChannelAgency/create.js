(function () {
    var controllerId = 'app.manager.channel.channelAgency.create';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.channelAgencyForEnd', 'infrastructure.services.app.channelAgentForEnd', '$stateParams', '$state', '$uiModal',
            function ($scope, channelAgencyService, channelAgentService, $stateParams, $state, $uiModal) {
                var vm = this;
                vm.channelAgency = null;
                vm.channelAgents = [];
                vm.user = null;
                vm.getChannelAgents = function () {
                    channelAgentService.getAll().success(function (result) {
                        vm.channelAgents = result.items;
                    });
                };
                vm.selectUser = function () {
                    var modalInstance = $uiModal.open({
                        templateUrl: '/Areas/Manager/Views/Common/User/UserSelectorModal.cshtml',
                        controller: 'app.manager.user.userSelectorModal as vm',
                    });

                    modalInstance.result.then(function (result) {
                        vm.user = result;
                    });
                }
                vm.create = function () {
                    vm.channelAgency.userId = vm.user.id;
                    channelAgencyService.createChannelAgencyAsync(vm.channelAgency).success(function (result) {
                        infrastructure.notify.success(app.localize('SavedSuccessfully'));
                        $state.go("channel.channelAgency.index");
                    });
                };
                function initialize() {
                    vm.getChannelAgents();
                }
                initialize();
            }
        ]);
})();