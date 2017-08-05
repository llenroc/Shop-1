(function () {
    var controllerId = 'app.manager.channel.channelAgency.edit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.channelAgencyForEnd', '$stateParams', '$state',
            function ($scope, channelAgencyService, $stateParams, $state) {
                var vm = this;
                vm.channelAgency = null;
                channelAgencyService.get({ id: $stateParams.id }).success(function (result) {
                    vm.channelAgency = result;
                });
                vm.save = function () {
                    channelAgencyService.update(vm.channelAgency).success(function (result) {
                        infrastructure.notify.success(app.localize('SavedSuccessfully'));
                        $state.go("channel.channelAgency.index");
                    });
                };
            }
        ]);
})();