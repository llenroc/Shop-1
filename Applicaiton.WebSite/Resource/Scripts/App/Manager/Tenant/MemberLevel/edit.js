(function () {
    var controllerId = 'app.manager.memberLevel.edit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.memberLevel', '$stateParams', '$state',
            function ($scope, memberLevelService, $stateParams, $state) {
                var vm = this;
                vm.memberLevel = null;
                memberLevelService.get({ id: $stateParams.id }).success(function (result) {
                    vm.memberLevel = result;
                });
                vm.update = function () {
                    memberLevelService.update(vm.memberLevel).success(function (result) {
                        infrastructure.notify.success(app.localize('SavedSuccessfully'));
                        $state.go("memberLevel.index");
                    });
                };
            }
        ]);
})();