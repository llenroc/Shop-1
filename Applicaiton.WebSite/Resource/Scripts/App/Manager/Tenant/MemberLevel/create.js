(function () {
    var controllerId = 'app.manager.memberLevel.create';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.memberLevel', '$stateParams', '$state',
            function ($scope, memberLevelService, $stateParams, $state) {
                var vm = this;
                vm.memberLevel = {};
                var $memberLevelInformationForm = $("form");

                vm.create = function () {
                    var memberLevel = $memberLevelInformationForm.serializeObject();
                    memberLevelService.create(memberLevel).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("memberLevel.index");
                    });
                };
            }
        ]);
})();